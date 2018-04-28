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
#import "NetworkManager.h"

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
    
    CLLocationCoordinate2D coordinate = self.cLLManager.location.coordinate;
    CLLocationDegrees longitude = coordinate.longitude;
    CLLocationDegrees latitude = coordinate.latitude;
    
    MKCoordinateRegion myRegion = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
    [self.mapView setRegion:myRegion animated:YES];
    
    MKCoordinateSpanMake(0.06, 0.06);
    
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    [networkManager URLRequest:@"cafe" longitude:longitude latitude:latitude completion:^(NSMutableArray <Cafe *> *array) {
        
        for (Cafe *cafe in array) {
            [self.mapView addAnnotation:cafe];
        }
        [self.mapView showAnnotations:array animated:YES];
    }];
    

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

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
