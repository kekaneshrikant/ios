//
//  BrowserViewController.h
//  Halloween
//
//  Created by SourceKode on 01/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController <UITextFieldDelegate,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property (weak, nonatomic) IBOutlet UIWebView *browserWebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *browserSpinner;

- (IBAction)buttonClicked:(id)sender;
- (IBAction)backButtonClicked:(UIBarButtonItem *)sender;

- (IBAction)refreshButtonClicked:(UIBarButtonItem *)sender;

- (IBAction)forwardButtonClicked:(UIBarButtonItem *)sender;

@end
