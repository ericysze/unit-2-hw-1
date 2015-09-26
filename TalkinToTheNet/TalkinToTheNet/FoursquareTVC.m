//
//  FoursquareTVC.m
//  TalkinToTheNet
//
//  Created by Eric Sze on 9/25/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "FoursquareTVC.h"
#import "FoursquareAPIManager.h"
#import "venueInfo.h"
#import "FoursquareInfoTableViewCell.h"

@interface FoursquareTVC ()
<
UITableViewDataSource,
UITableViewDelegate,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation FoursquareTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Foursquare API Requests";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.searchTextField.delegate = self;
    
}

- (void)fetchFoursquareData:(NSString *)searchTerm
            callbackBlock:(void(^)())block {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?client_id=ERLM1NQGQT3VSJORZQXMWA4UJ1JXLFIKJI3CMI4PCAMYA0WC&client_secret=5GNS1DNYEIEIIRJ3NLVYUWZSKCIELRFIVO2RFWDCQIOG1MLQ&v=20130815&ll=40.7,-74&query=%@", searchTerm];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // create an instagram url
    NSURL *instagramURL = [NSURL URLWithString:encodedString];
    
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
            
//            NSLog(@"%@", self.searchResults);
        }
        
        block();
    }];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FoursquareInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoursquareCellIdentifier" forIndexPath:indexPath];
    
    venueInfo *info = self.searchResults[indexPath.row];
    
    cell.restaurantNameLabel.text = info.name;
    cell.addressLabel.text = info.address;
    cell.phoneNumberLabel.text = info.formattedPhone;
    cell.twitterLabel.text = info.twitter;
    
    return cell;
}

#pragma mark - text field delegate

// when user taps "return" key on keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // dismiss the keyboard with message:
    [self.view endEditing:YES];
    
    // make an api request
    [self fetchFoursquareData:textField.text callbackBlock:^{
        [self.tableView reloadData];
    }];
    
    return YES;
}

@end

