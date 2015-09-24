//
//  Annotation.h
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Annotation : NSObject<MKAnnotation>
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (copy,nonatomic) NSString *title;
-(id) initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D) location;
-(MKAnnotationView *) annotationView;


@end
