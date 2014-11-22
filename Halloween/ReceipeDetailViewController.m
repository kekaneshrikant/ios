//
//  ReceipeDetailViewController.m
//  Halloween
//
//  Created by SourceKode on 22/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "ReceipeDetailViewController.h"

@interface ReceipeDetailViewController ()

@end

@implementation ReceipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"The dictionary is %@",self.receipeDictionary);
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
