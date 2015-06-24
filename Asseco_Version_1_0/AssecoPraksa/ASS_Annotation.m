//
//  ASS_Annotation.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Annotation.h"

@implementation ASS_Annotation
@synthesize  latitude, longitude, title;

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
      latitude = [[[[[jsonDictionary objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"location"] valueForKey:@"lng"];
    longitude = [[[[[jsonDictionary objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"location"] valueForKey:@"lat"];
    title = [[[[jsonDictionary objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"city"];
    }
    
    return self;

}

@end
