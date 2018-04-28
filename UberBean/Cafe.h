//
//  Cafe.h
//  UberBean
//
//  Created by Brian Vo on 2018-04-27.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Cafe : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy, nullable) NSString *title;

@property (nonatomic) NSDictionary *cafeDict;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageURL;
@property (nonatomic) NSNumber *rating;
@property (nonatomic) NSDictionary *location;
@property (nonatomic) CLLocationDegrees longitude;
@property (nonatomic) CLLocationDegrees latitude;


- (instancetype)initWithJSON:(NSDictionary *)json;

-(void)processData;

@end
