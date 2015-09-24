//
//  BuyViewController.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "BuyViewController.h"
#import "CustomViewCell.h" 
@interface BuyViewController ()

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"customCell";
    
    CustomViewCell *cell = (CustomViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"customCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.priceLabel.text = @"price";
    cell.thumbnailImage.image = [UIImage imageNamed:@"placeholder.jpg"];
    //cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    // Configure the cell
    /*PFFile *thumbnail = [object objectForKey:@"imageFile"];
     PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:200];
     thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
     thumbnailImageView.file = thumbnail;
     [thumbnailImageView loadInBackground];
     
     UILabel *nameLabel = (UILabel*) [cell viewWithTag:201];
     nameLabel.text = [object objectForKey:@"address"];
     
     // NSLog(@"%@", [object objectForKey:@"address"]);
     // NSLog(@" hello");*/
   // return cell;
//}
//
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
