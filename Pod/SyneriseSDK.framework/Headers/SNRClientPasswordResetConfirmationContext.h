//
//  SNRClientPasswordResetConfirmationContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientPasswordResetConfirmationContext)
@interface SNRClientPasswordResetConfirmationContext : SNRBaseContext

@property (copy, nonatomic, nonnull, readonly) NSString *password;
@property (copy, nonatomic, nonnull, readonly) NSString *token;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (instancetype)init:(NSString *)password token:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
