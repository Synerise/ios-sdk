//
//  SRClientManager.h
//  SyneriseBeacon
//
//  Created by Milosz Balus on 20.03.2015.
//  Copyright (c) 2015 Humanoit Group. All rights reserved.
//
#import "SRAbstractManager.h"
#import "SRClientModel.h"

typedef void(^ClientManagerSuccessBlock)(void);
typedef void(^ClientManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^ClientManagerRetryBlock)();

@interface SRClientManager : SRAbstractManager

@property (nonatomic, strong) SRClientModel *loggedClientData;
@property (nonatomic, strong, readonly) NSString *autologinEmail;
@property (nonatomic, strong, readonly) NSString *autologinPassword;

@property (nonatomic, assign, readonly, getter = isClientLoggedIn) BOOL clientLoggedIn;
@property (nonatomic, assign, readonly, getter = isAnonymousClient) BOOL anonymousClient;
@property (nonatomic, assign) BOOL autologin;

- (NSString*)verifyEmail:(NSString*)email;

- (void)registerClientWithEmail:(NSString*)email
                     password:(NSString*)password
                 successBlock:(ClientManagerSuccessBlock)successBlock
                   retryBlock:(ClientManagerRetryBlock)retryBlock
               andFailedBlock:(ClientManagerFailedBlock)failedBlock;

- (void)loginClientWithEmail:(NSString*)email
                  password:(NSString*)password
              successBlock:(ClientManagerSuccessBlock)successBlock
                retryBlock:(ClientManagerRetryBlock)retryBlock
            andFailedBlock:(ClientManagerFailedBlock)failedBlock;

- (void)resetPassordByEmail:(NSString*)email
               successBlock:(ClientManagerSuccessBlock)successBlock
                 retryBlock:(ClientManagerRetryBlock)retryBlock
             andFailedBlock:(ClientManagerFailedBlock)failedBlock;

-(void) clientLoggedOut;

@end
