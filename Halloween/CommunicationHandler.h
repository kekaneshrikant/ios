//
//  CommunicationHandler.h
//  Halloween
//
//  Created by SourceKode on 23/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CommunicationHandlerDelegate <NSObject>

-(void) recievedData:(NSDictionary *) dictionary;

@end


@interface CommunicationHandler : NSObject

@property (nonatomic,weak) id<CommunicationHandlerDelegate> delegate;

+(void) makeNetworkRequestForURLString:(NSString *)urlString;

-(void) makeNetworkRequestForURLString:(NSString *)urlString;

@end
