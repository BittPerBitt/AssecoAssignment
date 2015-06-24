//
//  ASS_Transakcije.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/1/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_Transakcije : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSMutableArray *jsonTrans;
@property (nonatomic, strong) NSMutableArray *transArray;
@property (strong,nonatomic) NSMutableArray *filteredTransArray;
@property IBOutlet UISearchBar *transSearchBar;
@property(nonatomic) NSInteger selectedScopeButtonIndex;
@property(nonatomic, copy) UISegmentedControl *scopeButtonTitles;

@property (strong, nonatomic) IBOutlet UINavigationItem *transTitle;

-(void) retrieveJSONdataTrans;

-(IBAction)goToSearch:(id)sender;


@end
