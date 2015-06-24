//
//  ASS_JSON_TL.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASS_JSON_TL : NSObject

@property (nonatomic, strong) NSString *curencyCode;
@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, strong) NSString *buyRate;
@property (nonatomic, strong) NSString *middleRate;
@property (nonatomic, strong) NSString *sellRate;

-(id) initWithCurencyCode: (NSString *) tlCode andCountryName: (NSString *) tlName andCountryCode: (NSString *) tlCountryCode andBuyRate: (NSString *) tlBuyRate andMiddleRate: (NSString *) tlMiddleRate andSellRate:(NSString *) tlSellRate;

@end
