//
//  SNRToken.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2022 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNRToken : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *tokenString;
@property (copy, nonatomic, nonnull, readonly) NSDate *expirationDate;

@property (copy, nonatomic, nonnull, readonly) NSString *rlm;
@property (assign, nonatomic, readonly) SNRTokenOrigin origin;
@property (copy, nonatomic, nonnull, readonly) NSString *customId;

- (BOOL)isNearExpiring;

@end

NS_ASSUME_NONNULL_END
