//
//  ReceipeDetailViewController.m
//  Halloween
//
//  Created by SourceKode on 22/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "ReceipeDetailViewController.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface ReceipeDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ingredientsLabel;

@property (weak, nonatomic) IBOutlet UILabel *procedureLabel;
@end

@implementation ReceipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView.image = [UIImage imageNamed:self.receipeDictionary[@"imageName"]];
    self.nameLabel.text = self.receipeDictionary[@"name"];
    self.ingredientsLabel.text = self.receipeDictionary[@"ingredients"];
    self.procedureLabel.text = self.receipeDictionary[@"procedure"];
   
    
    NSLog(@"The dictionary is %@",self.receipeDictionary);
}


-(void) viewDidLayoutSubviews{
    [self.ingredientsLabel setPreferredMaxLayoutWidth:0.9 * self.view.frame.size.width];
    self.ingredientsLabel.numberOfLines = 0;
    
    [self.procedureLabel setPreferredMaxLayoutWidth:0.9 * self.view.frame.size.width];
    self.procedureLabel.numberOfLines = 0;
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

- (IBAction)shareButtonClicked:(UIButton *)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share on Social Media" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook",@"Twitter",@"Email",@"SMS", nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *buttonTitle =  [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Facebook"]) {
    
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
           SLComposeViewController * cVC= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [cVC setInitialText:self.ingredientsLabel.text];
            [cVC addImage:self.imageView.image];
            [self presentViewController:cVC animated:YES completion:nil];
            
        } else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No Facebook Account Setup" message:@"Need to setup a facebook Account" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
        }
        
        
    } else if ([buttonTitle isEqualToString:@"Twitter"]){
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewController * cVC= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [cVC setInitialText:self.ingredientsLabel.text];
            [cVC addImage:self.imageView.image];
            [self presentViewController:cVC animated:YES completion:nil];
            
        } else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No Twitter Account Setup" message:@"Need to setup a Twitter Account" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
        }
    } else if([buttonTitle isEqualToString:@"Email"]){
        
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *mCVC = [[MFMailComposeViewController alloc] init];
            [mCVC setToRecipients:@[@"kekaneshrikant@gmail.com"]];
            [mCVC setMessageBody:self.procedureLabel.text isHTML:YES];
            [mCVC setSubject:self.nameLabel.text];
            [self presentViewController:mCVC animated:YES completion:nil];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No Twitter Account Setup" message:@"Need to setup a Twitter Account" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];        }
        
        
    } else if([buttonTitle isEqualToString:@"SMS"]){
        
    }
}
@end
