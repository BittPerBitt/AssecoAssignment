//
//  ASS_CustomAnnotation.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ASS_CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;

-(id)initWithTitle:(NSString *) newTitle initWithSubtitle:(NSString *) newSubtitle Location:(CLLocationCoordinate2D)location;

-(MKAnnotationView *)annotationView;

@end
