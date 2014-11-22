//
//  ViewController.h
//  Halloween
//
//  Created by SourceKode on 01/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *myFirstLabel;

@property (strong,nonatomic) UILabel *mySecondLabel;

@property (strong,nonatomic) UIButton *mySecondButton;

@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@property (strong,nonatomic) UISwitch *mySecondSwitch;

@property (weak, nonatomic) IBOutlet UISlider *firstSlider;

@property (strong,nonatomic) UISlider *secondSlider;

@property (weak, nonatomic) IBOutlet UILabel *firstSliderLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondSliderLabel;

- (IBAction)firstSliderValueChanged:(UISlider *)sender;

- (IBAction)buttonClicked:(UIButton *)sender;

- (IBAction)myFirstSwitchTriggered:(UISwitch *)sender;

@end

