//
//  BrowserViewController.m
//  Halloween
//
//  Created by SourceKode on 01/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()



@end

@implementation BrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urlTextField.delegate = self;
    self.browserWebView.delegate = self;
    
    self.browserSpinner.hidden = YES;
    // Do any additional setup after loading the view.
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

- (IBAction)buttonClicked:(id)sender {
    
    UIBarButtonItem *barItem = (UIBarButtonItem *)sender;
    
    if ([barItem.title isEqualToString:@"Go"]) {
        
        [self.urlTextField resignFirstResponder];
        if (self.urlTextField.text.length > 0) {
            
            
            NSURL *url = [NSURL URLWithString:self.urlTextField.text];
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            
            [self.browserWebView loadRequest:urlRequest];
            
            NSLog(@"The URL is : %@",self.urlTextField.text);
        }
    }
    else if (barItem.tag == 2){
       NSLog(@"You clicked Rewind");
    }
    else if (barItem.tag == 3){
        NSLog(@"You clicked Refresh");
    }
    else if (barItem.tag == 4){
        NSLog(@"You clicked Foward");
    }
}

- (IBAction)backButtonClicked:(UIBarButtonItem *)sender {
    

    if (self.browserWebView.canGoBack == YES) {
        self.backButton.enabled = YES;
        [self.browserWebView goBack];
    }else{
        self.backButton.enabled = NO;
    }
    
    if (self.browserWebView.canGoForward == YES) {
        self.forwardButton.enabled = YES;
    }else{
        self.forwardButton.enabled = NO;
    }
}

- (IBAction)refreshButtonClicked:(UIBarButtonItem *)sender {
    [self.browserWebView reload];
}

- (IBAction)forwardButtonClicked:(UIBarButtonItem *)sender {
    if (self.browserWebView.canGoForward == YES) {
        self.forwardButton.enabled = YES;
        [self.browserWebView goForward];
    }else{
        self.forwardButton.enabled = NO;
    }
    
    if (self.browserWebView.canGoBack == YES) {
        self.backButton.enabled = YES;
    }else{
        self.backButton.enabled = NO;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void) webViewDidStartLoad:(UIWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.browserSpinner.hidden = NO;
    [self.browserSpinner startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.browserSpinner.hidden = YES;
    [self.browserSpinner stopAnimating];
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Error: %ld",error.code] message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [errorAlertView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.browserSpinner.hidden = YES;
    [self.browserSpinner stopAnimating];
}

@end
