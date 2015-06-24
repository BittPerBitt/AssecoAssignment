//
//  ASS_ListaATM.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/25/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_ListaATM.h"
#import "ASS_Maps.h"
#import "ASS_ATM_info.h"
#import "ASS_Cell_ATM.h"
#import "ASS_ATM_Detail.h"

@interface ASS_ListaATM ()

@end

@implementation ASS_ListaATM
@synthesize atmArrayMArray, jsonMArray, listATMtitle;

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
    self.navigationItem.title = NSLocalizedString(@"listATMtitle", nil);
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"rightBarButtonItemList", nil) style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;

    [self retrieveJSONdata];
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
    return atmArrayMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CellATM";
    
    ASS_Cell_ATM *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ASS_ATM_info * newATM;
    
    // Configure the cell...
    newATM =[atmArrayMArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = newATM.cityName;
    cell.subtitleLabel.text = newATM.cityAdress;
    cell.atmImage.image = [UIImage imageNamed:@"visual_dach_1.png"];

    NSMutableArray *distanceMArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"distanceMarray"] mutableCopy];
    NSString *newDistance;
    NSMutableArray *distanceCell = [[NSMutableArray alloc] init];
    
    for (int i=0; i < distanceMArray.count; i++)
    {
        newDistance = [distanceMArray objectAtIndex:i];
        [distanceCell addObjectsFromArray:distanceMArray];
    }
    
    NSString *distance;
    distance = [distanceCell objectAtIndex:indexPath.row];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%@ m", distance];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   if ([[segue identifier] isEqualToString:@"pushATMdetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        ASS_ATM_info *detailObject = [atmArrayMArray objectAtIndex:indexPath.row];

        [[segue destinationViewController] getCityDetail:detailObject];
    }
}

-(void) retrieveJSONdata
{
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    
    NSString *strURL = [NSString stringWithFormat:@"http://188.226.211.157/api/v1/api.php?method=getATMs&token=%@",
                        [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]];
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSError* error;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:&error];

    atmArrayMArray = [[NSMutableArray alloc] init];

    NSArray * jsonProba = [[json objectForKey:@"result"] objectForKey:@"Branch42items"];

    NSArray *cityJSON = [[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"city"];
    NSArray *adressJSON = [[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"street"];;
    NSArray *postJSON = [[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"country_code"];
    NSArray *stateJSON = [[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"country_name"];
    
    NSArray *weekDayJSON = [[[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"working_hours"] valueForKey:@"period_description"] objectAtIndex:0];
    NSArray *weekTimeJSON = [[[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"working_hours"] valueForKey:@"working_time"] objectAtIndex:0];
    NSArray *weekendDayJSON = [[[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"working_hours"] valueForKey:@"period_description"] objectAtIndex:1];
    NSArray *weekendTimeJSON = [[[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"working_hours"] valueForKey:@"working_time"] objectAtIndex:1];
    //week day time, weekend day time, smo morali razdvojiti jer se javljaju ista imena pa smo morali po indeksima gledati kako bi izvadili posebno vrijeme i dan za tjedan i posebno za vikend
    
    for (int i = 0; i < jsonProba.count; i++)
    {
        NSString *cName = [cityJSON objectAtIndex:i];
        NSString *cAdress = [adressJSON objectAtIndex:i];
        NSString *cPost = [postJSON objectAtIndex:i];
        NSString *cState = [stateJSON objectAtIndex:i];
        NSString *cWeekDay = [weekDayJSON objectAtIndex:0];
        NSString *cWeekTime = [weekTimeJSON objectAtIndex:0];
        NSString *cWeekendDay = [weekendDayJSON objectAtIndex:1];
        NSString *cWeekendTime = [weekendTimeJSON objectAtIndex:1];

        [atmArrayMArray addObject:[[ASS_ATM_info alloc] initWithCityName:cName andCityAdress:cAdress andCityPost:cPost andCityState:cState andWeekDay:cWeekDay andWeekTime:cWeekTime andWeekendDay:cWeekendDay andWeekendTime:cWeekendTime]];
    }
    [self.tableView reloadData];
}

@end
