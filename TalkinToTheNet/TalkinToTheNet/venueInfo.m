//
//  venueInfo.m
//  TalkinToTheNet
//
//  Created by Eric Sze on 9/25/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "venueInfo.h"

@implementation venueInfo

- (instancetype)initWithJSON:(NSDictionary *)json {
    if (self = [super init]) {
        
        self.name = [json objectForKey:@"name"];
        self.formattedPhone = json[@"contact"][@"formattedPhone"];
        self.address = json[@"location"][@"address"];
        
        return self;
    }
    return nil;
}


@end
