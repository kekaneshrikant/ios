//
//  ChocolateDetailViewController.h
//  Halloween
//
//  Created by SourceKode on 16/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChocolateDetailViewController : UIViewController

- (IBAction)swipedUp:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic,strong) NSString *name;

@end
