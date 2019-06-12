//
//  SNRToken.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface SNRToken : SNRBaseModel

@property (assign, nonatomic, readonly) NSString *tokenString;
@property (assign, nonatomic, readonly) SNRTokenOrigin tokenOrigin;

@property (strong, nonatomic, nonnull, readonly) NSDate *expirationDate;

- (BOOL)isNearExpiring;

@end

NS_ASSUME_NONNULL_END
