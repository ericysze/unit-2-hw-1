//
//  GoogleMapsDetailViewController.m
//  TalkinToTheNet
//
//  Created by Eric Sze on 9/27/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "GoogleMapsDetailViewController.h"
@import GoogleMaps;
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import "venueInfo.h"

@interface GoogleMapsDetailViewController ()

@property (strong, nonatomic) CLLocation *currentLocation;

@property (nonatomic,retain) CLLocationManager *locationManager;



@end

@implementation GoogleMapsDetailViewController {
    GMSMapView *mapView_;
}

- (NSString *)deviceLocation {
    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    return theLocation;
}

- (void)viewDidLoad {

    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.myVenue.latitude
                                                            longitude:self.myVenue.longitude
                                                                 zoom:12];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(self.myVenue.latitude, self.myVenue.longitude);
    marker.title = @"New York City";
    marker.snippet = @"New York";
    marker.map = mapView_;

    NSLog(@"%.02f %.02f", self.myVenue.latitude, self.myVenue.longitude);

    
    
//    if([CLLocationManager locationServicesEnabled]){
//        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
//        self.currentLocation = [[CLLocation alloc] initWithLatitude:appDelegate.currentLocation.coordinate.latitude longitude:appDelegate.currentLocation.coordinate.longitude];
//    }

    self.locationManager = [[CLLocationManager alloc] init];
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
//    
//    self.locationManager.distanceFilter = kCLDistanceFilterNone;
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
//    [self.locationManager startUpdatingLocation];
//    
//    
    
    
    
    
    
    
}


//- (void)startStandardUpdates
//{
//    // Create the location manager if this object does not
//    // already have one.
//    if (nil == locationManager)
//        locationManager = [[CLLocationManager alloc] init];
//    
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
//    
//    // Set a movement threshold for new events.
//    locationManager.distanceFilter = 500; // meters
//    
//    [locationManager startUpdatingLocation];
//}

@end
