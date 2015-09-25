//
//  FoursquareInfoTableViewCell.h
//  TalkinToTheNet
//
//  Created by Eric Sze on 9/25/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoursquareInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@end
