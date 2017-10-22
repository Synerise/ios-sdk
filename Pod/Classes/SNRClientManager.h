//
//  SRClientManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 20.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//
#import "SNRAbstractManager.h"
#import "SNRClientModel.h"

/**
 *  Success block
 */
typedef void(^ClientManagerSuccessBlock)(void);


/**
 *  Error block
 *
 */
typedef void(^ClientManagerFailedBlock)(NSError *error, UIAlertView *alertView);

/**
 *  Simple Error block
 *
 */
typedef void(^ClientManagerSimpleFailedBlock)();


/**
 *  Retry block
 */
typedef void(^ClientManagerRetryBlock)();



@interface SNRClientManager : SNRAbstractManager

/**
 *  Object with user information
 */
@property (nonatomic, strong) SNRClientModel *loggedClientData;


/**
 *  Client email used for autologin
 */
@property (nonatomic, strong, readonly) NSString *autologinEmail;


/**
 *  Client password used for autlologin
 */
@property (nonatomic, strong, readonly) NSString *autologinPassword;

/**
 *  Client UUID
 */
@property (nonatomic, strong, readonly) NSString *clientUUID;

/**
 *  Login token
 */
@property (nonatomic, strong, readonly) NSString *loginToken;


/**
 *  Flag for checking user login status
 */
@property (nonatomic, assign, readonly, getter = isClientLoggedIn) BOOL clientLoggedIn;


/**
 *  Flat for anonymous client
 */
@property (nonatomic, assign, readonly, getter = isAnonymousClient) BOOL anonymousClient;


/**
 *  Flag for client autologin
 */
@property (nonatomic, assign) BOOL autologin;


/**
 *
 * Set client UUID.
 *
 */
- (void) setClientUUID:(NSString *)clientUUID;

/**
 *
 * Verifty client email.
 *  
 */
- (NSString*)verifyEmail:(NSString*)email;

/**
 *
 * Get client information.
 *
 */
-(void)getClientProfileInfo:(ClientManagerSuccessBlock)successBlock
  andFailedBlock:(ClientManagerFailedBlock)failedBlock;


/**
 *
 * Register client by email
 *
 */
- (void)registerClientWithEmail:(NSString*)email
                       password:(NSString*)password
                   successBlock:(ClientManagerSuccessBlock)successBlock
                     retryBlock:(ClientManagerRetryBlock)retryBlock
                 andFailedBlock:(ClientManagerFailedBlock)failedBlock;



/**
 *
 * Login client by email
 *
 */
- (void)loginClientWithEmail:(NSString*)email
                    password:(NSString*)password
                successBlock:(ClientManagerSuccessBlock)successBlock
                  retryBlock:(ClientManagerRetryBlock)retryBlock
              andFailedBlock:(ClientManagerFailedBlock)failedBlock;


/**
 *
 * Login client by facebook
 *
 */
- (void)loginClientByFacebook:(NSString*)facebookAppId
                facebookToken:(NSString*)facebookAccessToken
                 clientParams:(NSDictionary*)clientParams
                 successBlock:(ClientManagerSuccessBlock)successBlock
                   retryBlock:(ClientManagerRetryBlock)retryBlock
               andFailedBlock:(ClientManagerSimpleFailedBlock)failedBlock;


/**
 *
 * Autologin client
 *
 */
- (void)autoLoginClientWithSuccessBlock:(ClientManagerSuccessBlock)successBlock
                         andFailedBlock:(ClientManagerSimpleFailedBlock)failedBlock;

/**
 *
 *  Reste client password
 *
 */
- (void)resetPassordByEmail:(NSString*)email
               successBlock:(ClientManagerSuccessBlock)successBlock
                 retryBlock:(ClientManagerRetryBlock)retryBlock
             andFailedBlock:(ClientManagerFailedBlock)failedBlock;




/**
 *  
 * Update client profil information.
 *
 */
- (void)updateClientWithFirstname:(NSString*)firstname
                         lastname:(NSString*)lastname
                          address:(NSString*)address
                          zipcode:(NSString*)zipcode
                             city:(NSString*)city
                       customData:(NSString*)customData
                     successBlock:(APISuccessBlock)successBlock
                    andErrorBlock:(APIErrorBlock)errorBlock;



- (void)changePassword:(NSString*)oldPassword
                    newPassword:(NSString*)newPassword
                   successBlock:(ClientManagerSuccessBlock)successBlock
                     retryBlock:(ClientManagerRetryBlock)retryBlock
                 andFailedBlock:(ClientManagerFailedBlock)failedBlock;

/**
 *
 * Update client marketing agreement.
 *
 */
- (void)enableEmailAgreement:(BOOL*)isEnabled;

- (void)enableSmsAgreement:(BOOL*)isEnabled;

/**
 *  Logout client. Delete session and token.
 */
-(void) clientLoggedOut;

@end
