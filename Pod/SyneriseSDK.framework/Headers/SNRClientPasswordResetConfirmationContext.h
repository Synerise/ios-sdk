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

@property (readonly, nonatomic, nonnull, copy) NSString *password;
@property (readonly, nonatomic, nonnull, copy) NSString *token;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)init:(NSString *)password token:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
