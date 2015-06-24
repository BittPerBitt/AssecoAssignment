//
//  ASS_TecajnaListaConnection.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_TecajnaListaConnection : UIViewController <UITabBarControllerDelegate>

@property(nonatomic, strong) NSMutableArray *informationArray;
@property (nonatomic, strong) NSMutableArray *jsonTL;
@property (nonatomic, strong) NSMutableArray *arrayTL;

@property (strong, nonatomic) IBOutlet UINavigationItem *tecajTitle;
@property (strong, nonatomic) IBOutlet UILabel *valuteLBL;
@property (strong, nonatomic) IBOutlet UILabel *midlleLBL;
@property (strong, nonatomic) IBOutlet UILabel *buySelLBL;

-(void) retrieveJSONdataTL;

@end
