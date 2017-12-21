//
//  SNRProfile.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIDevice;

@class SNRUpdateClientContext;
@class SNRCreateClientContext;
@class SNRRegisterClientContext;
@class SNRClientPasswordResetRequestContext;
@class SNRClientPasswordResetConfirmationContext;

/**
 SNRProfile is responsible for integration with Synerise profile methods.
 */
@interface SNRProfile : NSObject

NS_ASSUME_NONNULL_BEGIN
- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 Initializes SNRProfile module.

 @note This method needs to be called before any other method of SNRProfile class and only once during application lifecycle.

 @param apiKey Synerise API Key.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 Creates a new client record if no identifier has been assigned for him before in Synerise.

 @param context SNRCreateClientContext object with client's optional data. Not provided fields are not modified.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)createClient:(SNRCreateClientContext *)context
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 Registers new Client with email, password and optional data.

 @param context SNRRegisterClientContext object with client's email, password and other optional data. Not provided fields are not modified.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)registerClient:(SNRRegisterClientContext *)context
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure;

/**
 Updates client with id and optional data.

 @param clientId client's id
 @param context SNRUpdateClientContext object with client's optional data. Not provided fields are not modified.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)updateClient:(NSInteger)clientId
             context:(SNRUpdateClientContext *)context
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 Deletes client with provided id

 @param clientId client's id to be deleted.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)deleteClient:(NSInteger)clientId
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 Requests client's password reset with email. Client will receive a token on provided email address in order to use
 @c [SNRProfile confirmResetPassword:success:failure] method

 @param context SNRClientPasswordResetRequestContext object with client's email.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)resetPassword:(SNRClientPasswordResetRequestContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure;

/**
 Confirms client's password reset with new password and token provided.

 @param context SNRClientPasswordResetRequestContext object with client's password and token.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)confirmResetPassword:(SNRClientPasswordResetConfirmationContext *)context
                     success:(nullable void (^)(BOOL isSuccess))success
                     failure:(nullable void (^)(NSError *error))failure;

/**
 Registers user for push notifications.

 @param registrationToken device token string returned after successful push notifications registration on device or @c fcmToken from Firebase.
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)registerForPush:(NSString *)registrationToken
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure;

/**
 Registers user identified by @c clientId for push notifications.

 @param registrationToken device token string returned after successful push notifications registration on device or @c fcmToken from Firebase.
 @param clientId clientId
 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)registerForPush:(NSString *)registrationToken
               clientId:(NSInteger)clientId
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure;

/**
 Retrieves currrent Profile authentication token. This method provide valid token if Profile is initialized.

 @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one argument containing Profile authentication token.
 @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString * _Nonnull token))success
                    failure:(nullable void (^)(NSError * _Nonnull error))failure;

/**
 Enables/disables console logs from SNRProfile.

 @note It is not recommended to use debug mode in release version of your application.

 @param enabled Enables/disables console logs.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;
NS_ASSUME_NONNULL_END

@end
