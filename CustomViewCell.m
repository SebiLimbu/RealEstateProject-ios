//
//  CustomViewCell.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "CustomViewCell.h"

@implementation CustomViewCell
//@synthesize nameLabel = _nameLabel;
@synthesize priceLabel = _priceLabel;
@synthesize thumbnailImage = _thumbnailImage;
/*
- (void)awakeFromNib {
    // Initialization code
}*/
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.thumbnailImage.frame= CGRectMake(5,5,40,32.5);
   // self.imageView.frame = CGRectMake(5,5,40,32.5);
    float limgW =  self.thumbnailImage.image.size.width;
    if(limgW > 0) {
        self.textLabel.frame = CGRectMake(55,self.textLabel.frame.origin.y,self.textLabel.frame.size.width,self.textLabel.frame.size.height);
        self.detailTextLabel.frame = CGRectMake(55,self.detailTextLabel.frame.origin.y,self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height);
    }
}
@end
