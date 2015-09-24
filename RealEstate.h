//
//  RealEstate.h
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 13/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface RealEstate : NSObject
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) PFFile *imageFile;
@property (nonatomic, strong) NSNumber *price;
@end
