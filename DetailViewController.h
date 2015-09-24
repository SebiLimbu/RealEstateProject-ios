//
//  DetailViewController.h
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 13/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MapView.h"
#import "RealEstate.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
@interface DetailViewController : UIViewController
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet PFImageView *housePhoto;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, strong) RealEstate *realObj;

@property (weak, nonatomic) IBOutlet UIButton *infoRequest;

@end
