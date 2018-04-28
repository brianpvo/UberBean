//
//  NetworkManager.m
//  UberBean
//
//  Created by Brian Vo on 2018-04-27.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cafeArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)URLRequest:(NSString *)term longitude:(float)longitude latitude:(float)latitude completion:(void (^)(NSMutableArray <Cafe *> *array))completion {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.yelp.com/v3/businesses/search?term=%@&latitude=%f&longitude=%f", term, latitude, longitude]];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [urlRequest addValue:@"Bearer czW64vnYPyjrfugdWlPn8HDwFHioGEc_-0TU7qjQuwQTOyan2QcnzafJOmKIa5xt2NLkxvWkQz_VNQ-cvkxoNzGkjFhoxL_-vtAky871KgUQxwRMYVk4MBAOdZvjWnYx" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        id json = [NSJSONSerialization JSONObjectWithData:data
                                                  options:0
                                                    error:&error];
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        if ([json isKindOfClass:[NSDictionary class]]) {
            NSDictionary *jsonDict = (NSDictionary *)json;
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self processResponseDictionary:jsonDict];
                completion(self.cafeArray);
            }];
        }
    }];
    
    [dataTask resume];
}

-(void)processResponseDictionary:(NSDictionary *)jsonDict {
    //NSLog(@"jsonDict: %@", jsonDict);
    for (NSDictionary *businesses in jsonDict[@"businesses"]) {
        //NSLog(@"businesses %@", businesses);
        Cafe *cafe = [[Cafe alloc] initWithJSON:businesses];
        [self.cafeArray addObject:cafe];
    }
}

@end
