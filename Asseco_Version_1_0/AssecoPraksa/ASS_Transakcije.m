//
//  ASS_Transakcije.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/1/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Transakcije.h"
#import "ASS_Transakcije_JSON.h"
#import "ASS_Trans_detail_cell.h"
#import "ASS_Trans_View.h"
#import "KeychainItemWrapper.h"

#define getTransURL @"http://188.226.211.157/api/v1/api.php?method=getTransactions&token=%@"

@interface ASS_Transakcije ()

@end

@implementation ASS_Transakcije
@synthesize jsonTrans, transArray, filteredTransArray, transSearchBar, selectedScopeButtonIndex, scopeButtonTitles, transTitle;
;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"transTitle", nil);
    [self retrieveJSONdataTrans];

    [transSearchBar setShowsScopeBar:YES];
    [transSearchBar sizeToFit];
    
    // Hide the search bar until user scrolls up
    CGRect newBounds = [[self tableView] bounds];
    newBounds.origin.y = newBounds.origin.y + transSearchBar.bounds.size.height;
    [[self tableView] setBounds:newBounds];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        [tableView setRowHeight:72];
        NSLog(@"11 filtered aray se pokazuje");
        return [filteredTransArray count];
    } else {
        NSLog(@"222 trans aray se pokazuje");
        return [transArray count];
    }
    
    //return transArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellTrans";

    // Configure the cell...
    ASS_Trans_detail_cell *transCell=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ASS_Transakcije_JSON * newTrans=nil;
    // Configure the cell...
    newTrans =[transArray objectAtIndex:indexPath.row];
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        [tableView setRowHeight:72];
        NSLog(@"33 filtered aray se pokazuje");
        //ovdje se otvaraju table view cell kojem se poremeti velicina i sve ne stane
        newTrans = [filteredTransArray objectAtIndex:indexPath.row];
    } else
    {
        NSLog(@"44 trans aray se pokazuje");
        newTrans = [transArray objectAtIndex:indexPath.row];
    }
    
    transCell.amountCredLabelCell.text = newTrans.amount;
    transCell.dateCredLabelCell.text = [newTrans.value_date substringWithRange:NSMakeRange(0, 10)];
    transCell.numberCredLabelCell.text = newTrans.creditorAccNumber;
    transCell.payment_descriptionLabelCell.text = newTrans.payment_description;
    transCell.valutaCredLabelCell.text = newTrans.currency;
 
    transCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return transCell;
}
/*
- (void)updateCell:(UIView *)cell withValue:(NSString *)value {
    NSParameterAssert(cell);
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)cell];
    if (cell) {
        self.transArray[indexPath.row] = value;
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void) retrieveJSONdataTrans
{
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    NSLog(@"\nToken: %@\n", [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]);
    
    NSString *strURL = [NSString stringWithFormat:getTransURL, [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];

    jsonTrans = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:nil];
    
    transArray = [[NSMutableArray alloc] init];
    
    NSArray *json = [[jsonTrans valueForKey:@"result"] valueForKey:@"items"];

    for (int i=0; i<json.count; i++)
    {
        NSString *transferID = [[json objectAtIndex:i] valueForKey:@"transfer_id"];
        NSString *creditorName = [[[json objectAtIndex:i] valueForKey:@"creditor"] valueForKey:@"name"];
        NSString *creditorCity = [[[json objectAtIndex:i] valueForKey:@"creditor"] valueForKey:@"city"];
        NSString *creditorAddress = [[[json objectAtIndex:i]valueForKey:@"creditor"] valueForKey:@"address"];
        NSString *creditorAccNumber = [[json objectAtIndex:i] valueForKey:@"creditor_account_number"];
        NSString *payment_description = [[json objectAtIndex:i] valueForKey:@"payment_description"];
        NSString *debtorAccNumber = [[json objectAtIndex:i] valueForKey:@"debtor_account_number"];
        NSString *currency = [[[json objectAtIndex:i] valueForKey:@"currency"] valueForKey:@"code"];
        NSString *amount = [[[json objectAtIndex:i] valueForKey:@"currency"] valueForKey:@"amount"];
        NSString *value_date = [[json objectAtIndex:i] valueForKey:@"value_date"];
        NSString *executed_date = [[json objectAtIndex:i] valueForKey:@"executed_date"];

        [transArray addObject:[[ASS_Transakcije_JSON alloc] initWithTransferID:transferID andCreditorName:creditorName andCreditorCity:creditorCity andCreditorAddress:creditorAddress andCreditorAccNumber:creditorAccNumber andPayment_description:payment_description andDebtorAccNumber:debtorAccNumber andCurrency:currency andAmount:amount andValue_date:value_date andExecuted_date:executed_date]];
    }
    
    [self.tableView reloadData];
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(UISearchBar*)scope {
	// Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    	
    [self.filteredTransArray removeAllObjects];
	// Filter the array using NSPredicate
    
    NSInteger index = scope.selectedScopeButtonIndex;
    
    if (index == 0 )
    {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.creditorAccNumber CONTAINS[cd] %@", searchText];
        NSArray *tempArray = [transArray filteredArrayUsingPredicate:predicate];
        filteredTransArray = [NSMutableArray arrayWithArray:tempArray];
        //CONTAINS
        //beginswith
    }
    else if (index == 1)
    {
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"%d => SELF.amount.intValue", [searchText integerValue]];
        NSArray *tempArray = [transArray filteredArrayUsingPredicate:scopePredicate];
        filteredTransArray = [NSMutableArray arrayWithArray:tempArray];
    }
    else if (index == 2)
    {
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"SELF.value_date contains[c] %@", searchText];
        NSArray *tempArray = [transArray filteredArrayUsingPredicate:scopePredicate];
        filteredTransArray = [NSMutableArray arrayWithArray:tempArray];
    }
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     self.searchDisplayController.searchBar];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     self.searchDisplayController.searchBar];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Perform segue to candy detail
    [self performSegueWithIdentifier:@"transDetail" sender:tableView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if ([[segue identifier] isEqualToString:@"transDetail"])
        {
        if (sender == self.searchDisplayController.searchResultsTableView)
        {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            ASS_Transakcije_JSON *detailTrans = [filteredTransArray objectAtIndex:indexPath.row];
            [[segue destinationViewController] getTransDetail:detailTrans];
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            ASS_Transakcije_JSON *detailTrans = [transArray objectAtIndex:indexPath.row];
            [[segue destinationViewController] getTransDetail:detailTrans];
        }
    }
}

-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
    self.searchDisplayController.searchBar.showsCancelButton = YES;
    UIButton *cancelButton;
    UIView *topView = self.searchDisplayController.searchBar.subviews[0];
    for (UIView *subView in topView.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            cancelButton = (UIButton*)subView;
        }
    }
    if (cancelButton) {
        //Set the new title of the cancel button
        [cancelButton setTitle:NSLocalizedString(@"searchCancel", nil) forState:UIControlStateNormal];
        
    }
}

-(IBAction)goToSearch:(id)sender
{
    [transSearchBar becomeFirstResponder];
}

@end
