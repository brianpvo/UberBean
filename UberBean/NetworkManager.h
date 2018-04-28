//
//  NetworkManager.h
//  UberBean
//
//  Created by Brian Vo on 2018-04-27.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cafe.h"

@interface NetworkManager : NSObject

@property (nonatomic) NSMutableArray <Cafe *> *cafeArray;

-(void)URLRequest:(NSString *)term longitude:(float)longitude latitude:(float)latitude completion:(void (^)(NSMutableArray <Cafe *> *array))completion;

@end
