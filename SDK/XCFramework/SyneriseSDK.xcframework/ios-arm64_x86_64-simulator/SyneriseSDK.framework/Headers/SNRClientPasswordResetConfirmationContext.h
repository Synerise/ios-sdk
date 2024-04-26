//
//  SNRClientPasswordResetConfirmationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientPasswordResetConfirmationContext
 */

NS_SWIFT_NAME(ClientPasswordResetConfirmationContext)
@interface SNRClientPasswordResetConfirmationContext : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *password;
@property (copy, nonatomic, nonnull, readonly) NSString *token;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithPassword:(NSString *)password andToken:(NSString *)token NS_SWIFT_NAME(init(password:token:));

@end

NS_ASSUME_NONNULL_END
