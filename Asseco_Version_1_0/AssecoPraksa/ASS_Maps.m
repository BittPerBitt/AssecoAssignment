//
//  ASS_Maps.m
//  AssecoPraksa
//
//  Created by Zlatko Matokanović on 5/20/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ASS_Maps.h"
#import "ASS_Annotation.h"
#import "ASS_CustomAnnotation.h"


@interface ASS_Maps ()

@end

@implementation ASS_Maps
@synthesize mapView, subtitle, title, jsonIndicator; //dropDown, butonChangeName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"mapTitle", nil);
    
    UIBarButtonItem *list = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"rightBarButtonItemList", nil)                                                                        style:UIBarButtonItemStyleDone                                                                       target:self action:@selector(openListTap:)];
    
    self.navigationItem.rightBarButtonItem=list;

    self.mapView.delegate = self;
    [self.mapView setShowsUserLocation:YES];
    
    [self jsonLokacije]; //prikazuje lokacije

    [mapView setMapType:MKMapTypeSatellite];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    NSLog(@"\n_SREMLJENI_TOKEN_: %@", [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]);
    self.title = @"Mape";

    [jsonIndicator startAnimating];
    jsonIndicator.hidesWhenStopped = YES;
    
    NSURL *urlAddress = [NSURL URLWithString:@"http://188.226.211.157/api/v1/api.php"];
    NSStringEncoding *encoding = NULL;
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        NSString *jsonreturn = [[NSString alloc] initWithContentsOfURL:urlAddress usedEncoding:encoding error:NULL];
        //When json is loaded stop the indicator
        [jsonIndicator performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
    });

}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{

    //get coortinations
    CLLocationCoordinate2D myLocation = [userLocation coordinate];
    //zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(myLocation, 2500, 2500);
    //show location
    
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    
    NSString *strURL = [NSString stringWithFormat:@"http://188.226.211.157/api/v1/api.php?method=getATMs&token=%@",
                        [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]];
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:&error];
    
    NSArray *locationJSON = [[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"location"];
    
    //NSObject->NSArray->NSmutableArray
    NSMutableArray * distanceMarray = [[NSMutableArray alloc] init];
    //NSArray *distanceArray = [[NSArray alloc] init];
    
    for (int i = 0; i <locationJSON.count; i++)
    {
        
        NSNumber *long1 = [[locationJSON objectAtIndex:i] objectForKey:@"lng"];
        NSNumber *lat1 = [[locationJSON objectAtIndex:i] objectForKey:@"lat"];
        
        long double lLong1 = [long1 doubleValue];
        long double lLat1 = [lat1 doubleValue];
        
        CLLocation *location1 = [[CLLocation alloc] initWithLatitude:lLong1 longitude:lLat1];
        CLLocation *location2 = [[CLLocation alloc] initWithLatitude:mapView.userLocation.coordinate.latitude longitude:mapView.userLocation.coordinate.longitude];
        
        float distanceMeters = [location1 distanceFromLocation:location2];
        
        NSString *distanceString = [NSString stringWithFormat:@"%.2f", distanceMeters];

        [distanceMarray addObject:[NSString stringWithFormat:distanceString]];

        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:distanceMarray forKey:@"distanceMarray"];
        [userDefaults synchronize];
        
    }
    
    [self.mapView setRegion:zoomRegion animated:YES];
    
    // Add an annotation
    ASS_CustomAnnotation *point = [[ASS_CustomAnnotation alloc] initWithTitle:@"Asseco" initWithSubtitle:@"Vaša lokacija" Location:myLocation];
    
    [self.mapView addAnnotation:point];
}

- (MKAnnotationView *)mapView:(MKMapView  *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[ASS_CustomAnnotation class]])
    {
        ASS_CustomAnnotation *myLocation = (ASS_CustomAnnotation *) annotation;
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"ASS_Custom_Annotation"];
        
        if(annotationView == nil)
            annotationView = myLocation.annotationView;
        else
            annotationView.annotation = annotation;
        return annotationView;
    }
    else
        return nil;
}

-(void)jsonLokacije
{
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    
    NSString *strURL = [NSString stringWithFormat:@"http://188.226.211.157/api/v1/api.php?method=getATMs&token=%@", [keychainWrapper objectForKey:(__bridge id)(kSecValueData)]];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:&error];

    // Get an array of dictionaries with the key "locations"
    NSArray *locationJSON = [[[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"] valueForKey:@"location"];
    NSArray *cityJSON = [[[json objectForKey:@"result"] objectForKey:@"Branch42items"] valueForKey:@"address"];
    
    //anotacije---OVA RADI----
    NSMutableArray * locations = [[NSMutableArray alloc] init];
    
    ASS_Annotation *anotacije;
    //------------
    
    for (int i = 0; i <locationJSON.count; i++)
    {
        anotacije = [[ASS_Annotation alloc] initWithJSONDictionary:json];
        anotacije.coordinate = CLLocationCoordinate2DMake ([[[locationJSON objectAtIndex:i] objectForKey:@"lng"] doubleValue], [[[locationJSON objectAtIndex:i] objectForKey:@"lat"] doubleValue]);
     
        anotacije.title = [[cityJSON objectAtIndex:i] objectForKey:@"city"];
        anotacije.subtitle = [[cityJSON objectAtIndex:i] objectForKey:@"street"];
        
        // Add the Location object to the array
        [locations addObject:anotacije];
    }

    [self.mapView addAnnotations:locations];
    //kako koristimo vise od jedne anotacije, dodali smo addAnnotationS-koji prepoznaje NsAray
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)openListTap:(id)sender{
    [self performSegueWithIdentifier:@"segueATM" sender:sender];
}


//20_5_2015_mapa napravljena i dohcava korisnikovu lokaciju, sad terba dohvatiti lokacije s jsona i drugih banaka
//AssecoPraksa doh slike gotovo_sad na MAPE______DAN___6_uveli smo keyChain za spremanje kod logina i profila, spremili token da mozemo pozvati kod dohvvacanja podataka za json
//22-rade anotacije pinovi, grad ulica se ispisuje
//26-radi custom pin, sve lokacije s jsona u pinovima, dropdown, sad dohvatiti podatke s jsona
//26 -  gotov dohvacanje podataka jejsona, ikonic se prikazuje, naslov, podnaslov, sda idemo u detaljan pregled bankomata a onda na udaljenost izmedu bankomata i moje lokacije da pise ispod slike

@end
