//
//  ResultTableViewController.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 15/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "ResultTableViewController.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "RealEstate.h"
#import "CustomViewCell.h"
@interface ResultTableViewController ()

@end

@implementation ResultTableViewController{
    NSArray *tableData;
    NSArray *thumbnails;
    NSArray *price;
}

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"RealEstate";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"address";
        self.imageKey = @"imageFile";
        self.textKey =@"price";
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Load the file content and read the data into arrays
   // [self.tableView registerNib:[UINib nibWithNibName:@"customCell"bundle:nil] forCellReuseIdentifier:@"Cell"];
                                 

}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    return query;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
 {
    static NSString *cellIdentifier = @"Cell";
    
   // CustomViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
     CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     if (cell == nil) {
         cell = [[CustomViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
     }
  
     PFFile *thumbnail = [object objectForKey:@"imageFile"];
    // UIImage *scaledImage = [thumbnail scaleToSize:CGSizeMake(60, 60)];
     PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:200];
     //thumbnailImageView.frame = CGRectMake(280, 5, 34, 34);
     CGRect frame = cell.frame;
     frame.size.width = 100;
     thumbnailImageView.frame=frame;
    // cell.thframe = frame;
     thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
     thumbnailImageView.file = thumbnail;
     //thumbnailImageView.frame = CGRe
     [thumbnailImageView loadInBackground];
     
     
    // NSString *value = [object objectForKey:@"price"];
     //NSNumber *number =[NSNumber numberWithInt:realObj.price ];
     //[NSNumber :realObj.price];
     // NSLog(@"%@",number.stringValue);  // Will print 3.25
   //  NSString *value = [NSString stringWithFormat:@"%i",number.intValue];
     UILabel *nameLabel = (UILabel*) [cell viewWithTag:201];
     nameLabel.text = [object objectForKey:@"address"];
   /*
    PFFile *thumbnail = [object objectForKey:@"imageFile"];
    PFImageView *thumbnailImageView =(PFImageView*) customCell.imageView;
   // thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    */
  
    //cell.priceLabel1.text= [object objectForKey:@"price"];
    // cell.priceLabel1.text = @"Sebi";
   return cell;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.priceLabel.text=@"sebi";
    return cell;
}*/


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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
