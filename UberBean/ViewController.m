//
//  ViewController.m
//  UberBean
//
//  Created by Brian Vo on 2018-04-27.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *cLLManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cLLManager = [[CLLocationManager alloc] init];
    [self.cLLManager requestWhenInUseAuthorization];
    
    self.cLLManager.delegate = self;
    
    
    [self.mapView setShowsUserLocation:YES];
    
    CLLocationCoordinate2D beginCoord = CLLocationCoordinate2DMake(49.281838, -123.108151);
    MKCoordinateRegion myRegion = MKCoordinateRegionMakeWithDistance(beginCoord, 500, 500);
    [self.mapView setRegion:myRegion animated:YES];
    
    MKCoordinateSpanMake(0.06, 0.06);

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    if (status == (kCLAuthorizationStatusAuthorizedWhenInUse | kCLAuthorizationStatusAuthorizedAlways)) {
        NSLog(@"made it");
        [self.cLLManager requestLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"yo");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"here");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
