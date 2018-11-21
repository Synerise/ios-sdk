//
//  SNRClientPasswordResetConfirmationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientPasswordResetConfirmationContext
 */

NS_SWIFT_NAME(ClientPasswordResetConfirmationContext)
@interface SNRClientPasswordResetConfirmationContext : SNRBaseContext

@property (copy, nonatomic, nonnull, readonly) NSString *password;
@property (copy, nonatomic, nonnull, readonly) NSString *token;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)initWithPassword:(NSString *)password andToken:(NSString *)token NS_SWIFT_NAME(init(password:token:));

@end

NS_ASSUME_NONNULL_END
