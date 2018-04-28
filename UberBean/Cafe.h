//
//  Cafe.h
//  UberBean
//
//  Created by Brian Vo on 2018-04-27.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Cafe : NSObject

@property (nonatomic) NSDictionary *cafeDict;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageURL;
@property (nonatomic) NSNumber *rating;
@property (nonatomic) NSDictionary *location;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSNumber *latitude;


- (instancetype)initWithJSON:(NSDictionary *)json;

-(void)processData;

@end
