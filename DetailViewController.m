//
//  DetailViewController.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 13/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "DetailViewController.h"
#import <Parse/Parse.h>

#import "CustomMapViewController.h"
@interface DetailViewController ()


@end

@implementation DetailViewController
@synthesize housePhoto;
@synthesize priceLabel;
@synthesize descriptionTextView;
@synthesize addressLabel;
@synthesize realObj;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Realestate";
    NSNumber *number =[NSNumber numberWithInt:realObj.price ];
        //[NSNumber :realObj.price];
   // NSLog(@"%@",number.stringValue);  // Will print 3.25
   NSString *value = [NSString stringWithFormat:@"%i",number.intValue];
    self.priceLabel.text = value ;
    self.addressLabel.text = realObj.address;
    //self.recipePho
    self.housePhoto.file = realObj.imageFile;
    self.descriptionTextView.text = realObj.description;
    
    NSLog(@"text:%@",self.priceLabel.text);
}
- (void)viewDidUnload
{
    [self setHousePhoto:nil];
    [self setPriceLabel:nil];
    [self setAddressLabel:nil];
    [self setDescriptionTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showInfo" ]) {
        // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CustomMapViewController *destViewController = [segue destinationViewController];
        
        // PFObject *object = [self.objects objectAtIndex:indexPath.row];
        //MapLocation *coordinateRecord = [[MapLocation alloc] init];
        //coordinateRecord.name= @"sebi";
        
        //destViewController.coordinateRecord = coordinateRecord;
      //destViewController.requestInfo = @"70 spring preston";
    destViewController.requestInfo = realObj.address;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
