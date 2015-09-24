//
//  AddInfoViewController.m
//  RealEstateProject
//
//  Created by SARASWATI LIMBU on 13/06/2015.
//  Copyright (c) 2015 SaraOrg. All rights reserved.
//

#import "AddInfoViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import "ListTableViewController.h"

@interface AddInfoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *realImageView;
@property (weak, nonatomic) IBOutlet UIButton *uploadButton;
//@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@property (weak, nonatomic) IBOutlet UITextField *houseNoTextField;
@property (weak, nonatomic) IBOutlet UITextField *stNoTextField;
@property (weak, nonatomic) IBOutlet UITextField *suburbTextField;

//@property (weak, nonatomic) IBOutlet UITextField *stateTextField;

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _priceTextField.delegate =self;
    _houseNoTextField.delegate =self;
    _stNoTextField.delegate =self;
    _suburbTextField.delegate= self;
   // _stateTextField.delegate=self;
    _descriptionTextField.delegate=self;
    
 
    
    
}
- (IBAction)upload:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.allowsEditing = NO;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    //[self.navigationController presentModalViewController: mediaUI animated: YES];
}

- (IBAction)unwindToA:(UIStoryboardSegue *)segue
{
    //returning to A
}
- (IBAction)onCancel:(id)sender {
   // ListTableViewController *obj =[[ListTableViewController alloc]initWithNibName:@"nextViewController" bundle:nil];
    //[self.navigationController pushViewController:obj animated:YES];
   // [obj release];
   // self.navigationItem.hidesBackButton = YES;

}
- (IBAction)saveDetails:(id)sender {

    // Create PFObject with recipe information
    PFObject *realObj = [PFObject objectWithClassName:@"RealEstate"];
    
  // NSString *fullAddress =  [NSString stringWithFormat: @"%@ %@%@ %@", _houseNoTextField.text, _stNoTextField.text,_suburbTextField.text,_stateTextField.text];
      NSString *fullAddress =  [NSString stringWithFormat: @"%@ %@%@", _houseNoTextField.text, _stNoTextField.text,_suburbTextField.text];
   //NSString *fullAddress=@"72 Spring Preston";
    [realObj setObject:fullAddress forKey:@"address"];
    //[realObj setObject:_priceTextField.text forKey:@"price"];
    //[realObj setObject:_priceTextField.text forKey:@"price"];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
   NSNumber *myNumber = [f numberFromString:_priceTextField.text];
    
    //NSNumber *myNumber = 1234567;
    //[realObj setObject:_priceTextField.text forKey:@"price"];
    [realObj setObject:myNumber forKey:@"price"];
    //NSArray *ingredients = [_ingredientsTextField.text componentsSeparatedByString: @","];
    //[realObj setObject:ingredients forKey:@"ingredients"];
    
    // Recipe image
    NSData *imageData = UIImageJPEGRepresentation(_realImageView.image, 0.8);
   // NSString *filename = [NSString stringWithFormat:@"%@.png", _addressTextField.text];
    NSString *filename = [NSString stringWithFormat:@"%@.png", fullAddress];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    [realObj setObject:imageFile forKey:@"imageFile"];
    
    // Show progress
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Uploading";
    [hud show:YES];
    
    // Upload recipe to Parse
    [realObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [hud hide:YES];
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            // Notify table view to reload the recipes from Parse cloud
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTable" object:self];
            
            // Dismiss the controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }];

}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    
    return YES;
}
/*
- (IBAction)save:(id)sender {
    // Create PFObject with recipe information
    PFObject *realObj = [PFObject objectWithClassName:@"RealEstate"];
    [realObj setObject:_addressTextField.text forKey:@"address"];
    [realObj setObject:_priceTextField.text forKey:@"price"];
    
    //NSArray *ingredients = [_ingredientsTextField.text componentsSeparatedByString: @","];
    //[realObj setObject:ingredients forKey:@"ingredients"];
    
    // Recipe image
    NSData *imageData = UIImageJPEGRepresentation(_realImageView.image, 0.8);
    NSString *filename = [NSString stringWithFormat:@"%@.png", _addressTextField.text];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    [realObj setObject:imageFile forKey:@"imageFile"];
    
    // Show progress
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Uploading";
    [hud show:YES];
    
    // Upload recipe to Parse
    [realObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [hud hide:YES];
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the recipe" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            // Notify table view to reload the recipes from Parse cloud
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTable" object:self];
            
            // Dismiss the controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }];
}*/


- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    UIImage *originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    self.realImageView.image = originalImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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
