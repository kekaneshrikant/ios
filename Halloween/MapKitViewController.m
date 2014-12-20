//
//  MapKitViewController.m
//  Halloween
//
//  Created by SourceKode on 20/12/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "MapKitViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MapKitViewController () <CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager *myLocationManager;

@end

@implementation MapKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.showsUserLocation = YES;
   
    if([CLLocationManager locationServicesEnabled]){
     self.myLocationManager = [[CLLocationManager alloc] init];
       // self.myLocationManager.delegate = self;
        [self.myLocationManager startUpdatingLocation];
    }else{
        NSLog(@"Location services are not available");
    }
    
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

@end
