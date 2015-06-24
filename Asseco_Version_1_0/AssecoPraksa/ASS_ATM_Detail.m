//
//  ASS_ATM_Detail.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/31/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_ATM_Detail.h"

@interface ASS_ATM_Detail ()

@end

@implementation ASS_ATM_Detail
@synthesize cityAdress, cityName, cityPost, cityState, cityDetail, weekDay, weekTime, weekendDay, weekendTime, imageDetail, detailTitle;

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
    self.navigationItem.title = NSLocalizedString(@"detailTitle", nil);

	// Do any additional setup after loading the view.
    [self setLabels];
    [self setImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getCityDetail:(id)cityDetailObject
{
    cityDetail = cityDetailObject;
}

- (void) setLabels
{
    cityName.text = cityDetail.cityName;
    cityAdress.text = cityDetail.cityAdress;
    cityState.text = cityDetail.cityPost;
    cityPost.text = cityDetail.cityState;
    weekDay.text = cityDetail.weekDay;
    weekTime.text = cityDetail.weekTime;
    weekendDay.text = cityDetail.weekendDay;
    weekendTime.text = cityDetail.weekendTime;

}

-(void) setImage
{
    imageDetail.image = [UIImage imageNamed:@"visual_dach.png"];
}


@end
