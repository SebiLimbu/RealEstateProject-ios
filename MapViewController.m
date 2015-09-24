//
//  MapViewController.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 14/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
@interface MapViewController ()
//@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation MapViewController
float latfloatvalue =27.99824106;
float longfloatvalue= 153.42096322;
//CLLocationCoordinate coordinate;
//CLLocationCoordinate2D location;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    
    location.latitude= (double) 44.476625;
    location.longitude=(double) -73.212827;
    
    CLLocationCoordinate2D mapCentre = CLLocationCoordinate2DMake(location.latitude , location.longitude);
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mapCentre, 500, 500);
    
    //latfloatvalue = [self.latitude floatValue];
    //longfloatvalue= [self.longitude floatValue];
    
    [self.mapView setRegion:viewRegion animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    annotation.coordinate = viewRegion.center;
    
    [self.mapView addAnnotation:annotation];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // Try to dequeue an existing pin view first.
    MKPinAnnotationView* pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    
    if (!pinView)
    {
        // If an existing pin view was not available, create one.
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    }
    else
    {
        pinView.annotation = annotation;
    }
    
    return pinView;
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
