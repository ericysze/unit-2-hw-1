//
//  venueInfo.h
//  TalkinToTheNet
//
//  Created by Eric Sze on 9/25/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface venueInfo : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *formattedPhone;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *twitter;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
