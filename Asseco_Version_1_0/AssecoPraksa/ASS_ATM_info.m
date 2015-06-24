//
//  ASS_ATM_info.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/25/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_ATM_info.h"

@implementation ASS_ATM_info
@synthesize cityName, cityAdress, cityPost, cityState, weekDay, weekTime, weekendDay, weekendTime;

-(id) initWithCityName: (NSString *) cName andCityAdress: (NSString *) cAdress andCityPost: (NSString *) cPost andCityState: (NSString *) cState andWeekDay: (NSString *) cWeekDay andWeekTime: (NSString *) cWeekTime andWeekendDay: (NSString *) cWeekendDay andWeekendTime: (NSString *)cWeekendTime
{
    self = [super init];
    if (self)
    {
        cityName = cName;
        cityAdress = cAdress;
        cityPost = cPost;
        cityState = cState;
        weekDay = cWeekDay;
        weekTime = cWeekTime;
        weekendDay = cWeekendDay;
        weekendTime = cWeekendTime;

        //distanceMeters
    }
    return self;
}

@end
