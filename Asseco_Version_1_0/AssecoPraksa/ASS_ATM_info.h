//
//  ASS_ATM_info.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/25/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASS_ATM_info : NSObject

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityAdress;
@property (nonatomic, strong) NSString *cityPost;
@property (nonatomic, strong) NSString *cityState;
@property (nonatomic, strong) NSString *weekDay;
@property (nonatomic, strong) NSString *weekTime;
@property (nonatomic, strong) NSString *weekendDay;
@property (nonatomic, strong) NSString *weekendTime;

//distanceMeters



-(id) initWithCityName: (NSString *) cName andCityAdress: (NSString *) cAdress andCityPost: (NSString *) cPost andCityState: (NSString *) cState andWeekDay: (NSString *) cWeekDay andWeekTime: (NSString *) cWeekTime andWeekendDay: (NSString *) cWeekendDay andWeekendTime: (NSString *)cWeekendTime;

@end
