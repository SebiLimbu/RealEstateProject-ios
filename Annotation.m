//
//  Annotation.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
-(id) initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D) location{
    self = [super init];
    if(self){
        _title = newTitle;
        _coordinate = location;
    }
    return self;
}

-(MKAnnotationView *)annotationView{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyCustomAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"park_icon"];
    annotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}
@end
