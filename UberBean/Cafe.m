//
//  Cafe.m
//  UberBean
//
//  Created by Brian Vo on 2018-04-27.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "Cafe.h"

@interface Cafe ()

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy, nullable) NSString *title;

@end

@implementation Cafe

- (instancetype)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _cafeDict = [[NSDictionary alloc] initWithDictionary:json];
        [self processData];
    }
    return self;
}

-(void)processData {
    self.name = self.cafeDict[@"name"];
    self.imageURL = self.cafeDict[@"image_url"];
    self.location = [[NSDictionary alloc] initWithDictionary:self.cafeDict[@"location"]];
    self.rating = self.cafeDict[@"rating"];
    self.longitude = [self.cafeDict[@"coordinates"][@"longitude"] floatValue];
    self.latitude = [self.cafeDict[@"coordinates"][@"latitude"] floatValue];
    self.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    self.title = self.cafeDict[@"title"];
}

@end
