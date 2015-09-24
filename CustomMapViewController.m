//
//  CustomMapViewController.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "CustomMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
@interface CustomMapViewController ()

@end

@implementation CustomMapViewController
@synthesize mapItem;
@synthesize coordinateRecord;
@synthesize receiveInfo;
@synthesize requestInfo;
CLLocationCoordinate2D location;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.receiveInfo.text = [self.requestInfo description ];
    

   if(self.geocoder == nil)
    {
        self.geocoder = [[CLGeocoder alloc] init];
    }
   // NSString *address = self.inputText.text;
    NSString *address =[self.requestInfo description ];
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if(placemarks.count > 0)
        {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            // self.outputLabel.text = placemark.location.description;
            self.receiveInfo.text = placemark.location.description;
            NSString *lat= placemark.location.description;
            
            NSArray *strings = [lat componentsSeparatedByString:@","];
            NSString* firstString = [strings objectAtIndex:0];
            NSString *newStr = [firstString substringFromIndex:1];
            double latdouble = [newStr doubleValue];
            NSString* secondString = [strings objectAtIndex:1];
            NSString *newSecondStr = [secondString substringFromIndex:1];
            double longdouble = [newSecondStr doubleValue];
            //self.outputLabel.text = newStr;
            location.latitude= (double) latdouble;
            location.longitude=(double) longdouble ;
            CLLocationCoordinate2D mapCentre = CLLocationCoordinate2DMake(location.latitude , location.longitude);
            Annotation *parkAnnotation = [[Annotation alloc]initWithTitle:address Location:mapCentre];
            
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mapCentre, 500, 500);
            
            //latfloatvalue = [self.latitude floatValue];
            //longfloatvalue= [self.longitude floatValue];
            
            [self.mapItem setRegion:viewRegion animated:YES];
            
            
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            
            annotation.coordinate = viewRegion.center;
            
            //[mapItem selectAnnotation:annotation animated:YES];
            // [self.mapItem addAnnotation:annotation];
            [self.mapItem addAnnotation:parkAnnotation];
            
        }
        else if (error.domain == kCLErrorDomain)
        {
            switch (error.code)
            {
                case kCLErrorDenied:
                    self.receiveInfo.text
                    = @"Location Services Denied by User";
                    break;
                case kCLErrorNetwork:
                    self.receiveInfo.text = @"No Network";
                    break;
                case kCLErrorGeocodeFoundNoResult:
                    self.receiveInfo.text = @"No Result Found";
                    break;
                default:
                    self.receiveInfo.text = error.localizedDescription;
                    break;
            }
            
            
        }
        else
        {
            self.receiveInfo.text = error.localizedDescription;
            
        }
        
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
