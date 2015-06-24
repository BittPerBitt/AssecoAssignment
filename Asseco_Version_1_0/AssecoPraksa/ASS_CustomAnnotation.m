//
//  ASS_CustomAnnotation.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_CustomAnnotation.h"

@implementation ASS_CustomAnnotation
@synthesize coordinate, title, subtitle;

-(id)initWithTitle:(NSString *) newTitle initWithSubtitle:(NSString *) newSubtitle Location:(CLLocationCoordinate2D)location
{
    self = [super init];
    if(self)
    {
        title = newTitle;
        subtitle = newSubtitle;
        coordinate = location;
    }
    return self;
}

-(MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"ASS_Custom_Annotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"asseco_see_logo2.png"];
    return  annotationView;
}

@end
