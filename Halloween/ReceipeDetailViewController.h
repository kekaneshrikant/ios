//
//  ReceipeDetailViewController.h
//  Halloween
//
//  Created by SourceKode on 22/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReceipeDetailViewController : UIViewController <UIActionSheetDelegate>

@property (strong,nonatomic) NSDictionary *receipeDictionary;

- (IBAction)shareButtonClicked:(UIButton *)sender;

@end
