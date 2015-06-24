//
//  ASS_TecLista.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_TecajnaListaConnection.h"
#import "ASS_JSON_TL.h"
#import "ASS_Cell_Tecajna_Lista.h"
#import "KeychainItemWrapper.h"

#define getTecListaURL @"http://188.226.211.157/api/v1/api.php?method=getCurrencyExchangeRate&token=%@"


@interface ASS_TecajnaListaConnection ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, UITabBarControllerDelegate>

@property(nonatomic, weak)IBOutlet UITableView *mainTableView;

@end

@implementation ASS_TecajnaListaConnection
@synthesize informationArray, jsonTL, arrayTL, tecajTitle, valuteLBL, midlleLBL, buySelLBL;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"tecajTitle", nil);
    [self setUILocaliztionString];
    
    self.navigationItem.hidesBackButton = YES;
    [self retrieveJSONdataTL];
    //[self setDelegate:self];
    [self.mainTableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayTL.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell_TL";

    ASS_Cell_Tecajna_Lista *tlCell=[self.mainTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    ASS_JSON_TL * newTL=nil;
    // Configure the cell...
    newTL =[arrayTL objectAtIndex:indexPath.row];
    
    tlCell.curencyCodeLBL.text = newTL.curencyCode;
    tlCell.middleRateLBL.text = [NSString stringWithFormat:@"%.5f", [newTL.middleRate floatValue]];
    tlCell.buyRateLBL.text = [NSString stringWithFormat:@"%.4f", [newTL.buyRate floatValue]];
    tlCell.sellRateLBL.text = [NSString stringWithFormat:@"%.4f", [newTL.sellRate floatValue]];
    tlCell.countryNameLBL.text = [newTL.countryName uppercaseString];
    
    return tlCell;
}

-(void) retrieveJSONdataTL
{
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    NSLog(@"\nToken: %@\n", [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]);
    
    NSString *strURL = [NSString stringWithFormat:getTecListaURL, [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    jsonTL = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:nil];
    arrayTL = [[NSMutableArray alloc] init];

    NSArray *jsonTLarray = [[jsonTL valueForKey:@"result"] valueForKey:@"items"];

    for (int i=0; i<jsonTLarray.count; i++)
    {
        NSString *curencyCode = [[jsonTLarray objectAtIndex:i] valueForKey:@"currency_code"];
        NSString *countryName = [[jsonTLarray objectAtIndex:i] valueForKey:@"country_name"];
        NSString *countryCode = [[jsonTLarray objectAtIndex:i] valueForKey:@"country_code"];
        NSString *buyRate = [[jsonTLarray objectAtIndex:i] valueForKey:@"buy"];
        NSString *middleRate = [[jsonTLarray objectAtIndex:i]valueForKey:@"middle"];
        NSString *sellRate = [[jsonTLarray objectAtIndex:i] valueForKey:@"sell"];
        
        [arrayTL addObject:[[ASS_JSON_TL alloc] initWithCurencyCode:curencyCode andCountryName:countryName andCountryCode:countryCode andBuyRate:buyRate andMiddleRate:middleRate andSellRate:sellRate]];

    }
    [self.mainTableView reloadData];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return viewController != tabBarController.selectedViewController;
}

-(void)setUILocaliztionString
{
    self.valuteLBL.text = NSLocalizedString(@"valuteLBL", nil);
    self.midlleLBL.text = NSLocalizedString(@"midlleLBL", nil);
    self.buySelLBL.text = NSLocalizedString(@"buySelLBL", nil);
}

@end
