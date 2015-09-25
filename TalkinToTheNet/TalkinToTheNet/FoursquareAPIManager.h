//
//  FoursquareAPIManager.h
//  TalkinToTheNet
//
//  Created by Eric Sze on 9/23/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoursquareAPIManager : NSObject

+ (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;


@end
