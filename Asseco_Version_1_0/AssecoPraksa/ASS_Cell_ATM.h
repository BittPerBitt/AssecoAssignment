//
//  ASS_Cell_ATM.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/26/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASS_Cell_ATM : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *atmImage;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;

@end
