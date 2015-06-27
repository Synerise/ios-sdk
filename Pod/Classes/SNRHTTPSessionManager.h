//
//  SRSessionManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 06.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

#define kErrorResponseObjectKey @"kErrorResponseObjectKey"

typedef void(^APIErrorBlock)(NSError *error);
typedef void(^APISuccessBlock)(id response);

@interface SNRHTTPSessionManager : AFHTTPSessionManager

/// The singleton. Use this to talk to API.
+ (instancetype)sharedManager;

- (NSURLSessionDataTask *)POST:(NSString*)path parameters:(NSDictionary*)params success:(APISuccessBlock)successBlock error:(APIErrorBlock)errorBlock withAuthorization:(BOOL)authorization;

- (NSURLSessionDataTask *)PUT:(NSString*)path parameters:(NSDictionary*)params success:(APISuccessBlock)successBlock error:(APIErrorBlock)errorBlock withAuthorization:(BOOL)authorization;

- (NSURLSessionDataTask *)GET:(NSString*)path parameters:(NSDictionary*)params success:(APISuccessBlock)successBlock error:(APIErrorBlock)errorBlock withAuthorization:(BOOL)authorization;

- (NSURLSessionDataTask *)PATCH:(NSString*)path parameters:(NSDictionary*)params success:(APISuccessBlock)successBlock error:(APIErrorBlock)errorBlock withAuthorization:(BOOL)authorization;



@end
