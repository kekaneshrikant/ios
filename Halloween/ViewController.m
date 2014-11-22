//
//  ViewController.m
//  Halloween
//
//  Created by SourceKode on 01/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end



@implementation ViewController
  NSInteger counter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.myFirstLabel.text = @"Label Through Code";
   self.myFirstLabel.textColor = [UIColor purpleColor];
   self.myFirstLabel.textAlignment = NSTextAlignmentLeft;
   
   //  UIFont *font = [[UIFont alloc] init];
   
    NSArray *fontNames = [UIFont fontNamesForFamilyName:@"Courier New"];
    NSLog(@"%@",fontNames);
    self.myFirstLabel.font = [UIFont fontWithName:@"CourierNewPSMT" size:20];
    
 
    //Allocate the object using initWithFrame
    self.mySecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.myFirstLabel.frame.origin.x, self.myFirstLabel.frame.origin.y + self.myFirstLabel.frame.size.height, 200, 44)];
    self.mySecondLabel.text = @"My Second Label";
    
    self.mySecondButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.mySecondButton.frame = CGRectMake(self.myFirstLabel.frame.origin.x, 150, 120, 44);
    
    [self.mySecondButton setTitle:@"Second Button" forState:UIControlStateNormal];
    
    [self.mySecondButton addTarget:self action:@selector(secondButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.mySecondSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.myFirstLabel.frame.origin.x, 200, 10, 10)];
    
    [self.mySecondSwitch setSelected:NO];
    
    [self.mySecondSwitch addTarget:self action:@selector(myFirstSwitchTriggered:) forControlEvents:UIControlEventValueChanged];
    
    self.firstSlider.maximumValue = 100;
    self.firstSlider.minimumValue = 10;
    
    
    self.secondSlider = [[UISlider alloc] initWithFrame:CGRectMake(self.myFirstLabel.frame.origin.x, 300, 100, 100)];
    
    self.secondSlider.minimumValue = 1;
    self.secondSlider.maximumValue = 10;
    
    [self.secondSlider addTarget:self action:@selector(secondSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.secondSlider];
    
    [self.view addSubview:self.mySecondSwitch];
    
    [self.view addSubview:self.mySecondButton];
    
    [self.view addSubview:self.mySecondLabel];
    
    counter = 0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 
 The function invoked by clicking on the second button.
 
 */
-(void) secondButtonClicked:(UIButton *)sender{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Button Clicked!" message:@"Thank you for clicking Button!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Okay",@"Retry", nil];
    
    [alertView show];
    //[self buttonClicked:sender];
}


// Second Slider Value Changed Event invoked through addTarget
-(void) secondSliderValueChanged:(UISlider *)sender{
    
    NSString *sliderValue = [NSString stringWithFormat:@"Value %f",sender.value ];
    
    self.secondSliderLabel.text = sliderValue;
}

// First Slider Value Event
- (IBAction)firstSliderValueChanged:(UISlider *)sender {
    
    NSString *sliderValue = [NSString stringWithFormat:@"Value %f",sender.value ];
 
    self.firstSliderLabel.text = sliderValue;
}

//First Button clicked event through Storyboard
- (IBAction)buttonClicked:(UIButton *)sender {
    
    counter++;
     [sender setTitle:@"Disabled"  forState:UIControlStateDisabled];
    if (counter == 10) {
        sender.enabled=NO;
    } else{
           [sender setTitle:[NSString stringWithFormat:@"Click %ld",counter]  forState:UIControlStateNormal];
    }
    
    
    NSLog(@"click %ld",counter);
    
}

//First Switch value Changed event prepared through Storyboard
- (IBAction)myFirstSwitchTriggered:(UISwitch *)sender {
    
    if (sender.on) {
        self.mySecondButton.enabled = YES;
    } else{
       self.mySecondButton.enabled = NO;
    }
    
}


// The Delegate function for the alert view
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if([alertView.title isEqualToString:@"Button Clicked!"]){
        if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Okay"]) {
            NSLog(@"Second Button clicked, %@ button clicked",[alertView buttonTitleAtIndex:buttonIndex]);
        } else if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Retry"]) {
            NSLog(@"Second Button clicked, %@ button clicked",[alertView buttonTitleAtIndex:buttonIndex]);
        } else if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Cancel"]) {
            NSLog(@"Second Button clicked, %@ button clicked",[alertView buttonTitleAtIndex:buttonIndex]);
        }
    }
    
    NSLog(@"Button Clicked at Index %ld",buttonIndex);
}


@end
