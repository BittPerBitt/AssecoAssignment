//
//  ASS_JSON_TL.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_JSON_TL.h"

@implementation ASS_JSON_TL
@synthesize curencyCode, countryName, countryCode, buyRate, middleRate, sellRate;

-(id) initWithCurencyCode: (NSString *) tlCode andCountryName: (NSString *) tlName andCountryCode: (NSString *) tlCountryCode andBuyRate: (NSString *) tlBuyRate andMiddleRate: (NSString *) tlMiddleRate andSellRate:(NSString *) tlSellRate
{
    self = [super init];
    if (self)
    {
        curencyCode = tlCode;
        countryName = tlName;
        countryCode = tlCountryCode;
        buyRate = tlBuyRate;
        middleRate = tlMiddleRate;
        sellRate = tlSellRate;
    }
    return self;
}

@end
