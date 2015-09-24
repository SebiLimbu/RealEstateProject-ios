//
//  CustomMapViewController.h
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapLocation.h"
@interface CustomMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *receiveInfo;
@property (nonatomic, strong) id  requestInfo;
@property (weak, nonatomic) IBOutlet MKMapView *mapItem;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property MapLocation *coordinateRecord;
@end
