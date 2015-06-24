//
//  ASS_ListaATM.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/25/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_ListaATM : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *atmArrayMArray;
@property (nonatomic, strong) NSMutableArray *jsonMArray;
@property (strong, nonatomic) IBOutlet UINavigationItem *listATMtitle;

-(void) retrieveJSONdata;

@end
