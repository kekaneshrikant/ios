//
//  ReceipeDetailViewController.m
//  Halloween
//
//  Created by SourceKode on 22/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "ReceipeDetailViewController.h"

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

@end
