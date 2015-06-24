//
//  ASS_Maps.h
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/20/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "KeychainItemWrapper.h"

@interface ASS_Maps : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *jsonATMsArray;
@property (nonatomic, copy) NSString *titleMap;
@property (nonatomic, copy) NSString *subtitle;
@property (strong, nonatomic) IBOutlet UIButton *butonChangeName;
@property (strong, nonatomic) IBOutlet UINavigationItem *mapTitle;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *jsonIndicator;

@end
