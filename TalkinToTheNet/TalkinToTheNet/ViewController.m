//
//  ViewController.m
//  TalkinToTheNet
//
//  Created by Michael Kavouras on 9/20/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "FoursquareAPIManager.h"
#import "venueInfo.h"

@interface ViewController ()

@property (nonatomic) NSArray *foursquareData;
@property (nonatomic) NSDictionary *names;

@property (nonatomic) NSMutableArray *searchResults;
@property (nonatomic) NSDictionary *response;
@property (nonatomic) NSArray *venues;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchFoursquareData];
    
}

- (void)fetchFoursquareData {
    
    // create an instagram url
    NSURL *instagramURL = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/search?client_id=ERLM1NQGQT3VSJORZQXMWA4UJ1JXLFIKJI3CMI4PCAMYA0WC&client_secret=5GNS1DNYEIEIIRJ3NLVYUWZSKCIELRFIVO2RFWDCQIOG1MLQ&v=20130815&ll=40.7,-74&query=sushi"];
    
    // fetch data from the instagram endpoint and print json response
    [FoursquareAPIManager GETRequestWithURL:instagramURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSDictionary *results = json[@"response"];
        
        NSArray *venues = [results objectForKey:@"venues"];
        
        // reset my array
        self.searchResults = [[NSMutableArray alloc] init];
        
        // loop through all json venues
        for (NSDictionary *result in venues) {
            
            venueInfo *info = [[venueInfo alloc] initWithJSON:result];
            [self.searchResults addObject:info];
            
            NSLog(@"%@", self.searchResults);
        
        }

        //[self.tableView reloadData];
        
        
//        // self.response = NSDictionary
//        self.response = [json objectForKey:@"response"];
//        // self.venues = NSArray
//        self.venues = [self.response objectForKey:@"venues"];
//        NSDictionary *getName = [self.venues objectAtIndex:0];
//        
//        NSDictionary *getForPhone = [getName objectForKey:@"contact"];
//        
//        NSString *name = [getName objectForKey:@"name"];
//        NSString *formattedPhone = [getForPhone objectForKey:@"formattedPhone"];
//        
//        
//        
//        NSLog(@"%@ %@", name, formattedPhone);

    }];
}





@end
