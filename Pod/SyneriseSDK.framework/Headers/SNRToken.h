//
//  SNRToken.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRToken
 */

NS_SWIFT_NAME(Token)
@interface SNRToken : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSString *tokenString;
@property (assign, nonatomic, readonly) SNRTokenOrigin tokenOrigin;

@property (strong, nonatomic, nonnull, readonly) NSDate *expirationDate;

- (BOOL)isNearExpiring;

@end

NS_ASSUME_NONNULL_END
