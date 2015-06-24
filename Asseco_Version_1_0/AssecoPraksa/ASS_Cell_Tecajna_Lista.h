//
//  ASS_Cell_Tecajna_Lista.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_Cell_Tecajna_Lista : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *curencyCodeLBL;
@property (strong, nonatomic) IBOutlet UILabel *middleRateLBL;
@property (strong, nonatomic) IBOutlet UILabel *buyRateLBL;
@property (strong, nonatomic) IBOutlet UILabel *sellRateLBL;
@property (strong, nonatomic) IBOutlet UILabel *countryNameLBL;

@end
