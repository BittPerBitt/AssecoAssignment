//
//  ASS_Annotation.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ASS_Annotation : NSObject <MKAnnotation>

@property (readonly) NSNumber *latitude;
@property (readonly) NSNumber *longitude;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
