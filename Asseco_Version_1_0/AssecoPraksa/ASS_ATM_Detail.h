//
//  ASS_ATM_Detail.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/31/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASS_ATM_info.h"

@interface ASS_ATM_Detail : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *cityName;
@property (nonatomic, strong) IBOutlet UILabel *cityAdress;
@property (nonatomic, strong) IBOutlet UILabel *cityPost;
@property (nonatomic, strong) IBOutlet UILabel *cityState;

@property (nonatomic, strong) IBOutlet UILabel *weekDay;
@property (nonatomic, strong) IBOutlet UILabel *weekTime;
@property (nonatomic, strong) IBOutlet UILabel *weekendDay;
@property (nonatomic, strong) IBOutlet UILabel *weekendTime;

@property (strong, nonatomic) IBOutlet UIImageView *imageDetail;
@property (strong, nonatomic) IBOutlet UINavigationItem *detailTitle;


@property (nonatomic, strong) ASS_ATM_info *cityDetail;

-(void) getCityDetail:(id)cityDetailObject;

-(void) setLabels;

-(void) setImage;


@end
