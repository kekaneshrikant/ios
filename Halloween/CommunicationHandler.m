//
//  CommunicationHandler.m
//  Halloween
//
//  Created by SourceKode on 23/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "CommunicationHandler.h"
@import UIKit;

@implementation CommunicationHandler

// Makes a network connection based on the URL specified
+(void) makeNetworkRequestForURLString:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
      //  NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
       // NSLog(@"%@ %@ %@",response,dataDictionary,connectionError);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"dataReceived" object:nil userInfo:dataDictionary];
    }];
    
}

// An instance level method
-(void) makeNetworkRequestForURLString:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //  NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
         NSLog(@"%@ %@ %@",response,dataDictionary,connectionError);
        
        if ([self.delegate respondsToSelector:@selector(recievedData:)]) {
            [self.delegate recievedData:dataDictionary];
        }
        
      //  [[NSNotificationCenter defaultCenter] postNotificationName:@"dataReceived" object:nil userInfo:dataDictionary];
    }];
    
    
    
}

@end
