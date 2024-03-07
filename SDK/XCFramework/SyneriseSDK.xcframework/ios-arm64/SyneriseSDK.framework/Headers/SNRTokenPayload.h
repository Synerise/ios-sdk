//
//  SNRTokenPayload.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTokenPayload
 */

NS_SWIFT_NAME(TokenPayload)
@interface SNRTokenPayload : NSObject

@property (copy, nonatomic, nonnull, readwrite) NSString *tokenString;
@property (copy, nonatomic, nonnull, readwrite) NSDate *expirationDate;
@property (copy, nonatomic, nonnull, readwrite) NSDate *creationDate;

@property (copy, nonatomic, nonnull, readonly) NSString *rlm;
@property (assign, nonatomic, readonly) SNRTokenOrigin origin;

@property (copy, nonatomic, nonnull, readonly) NSString *uuid;
@property (copy, nonatomic, nonnull, readonly) NSString *clientId;
@property (copy, nonatomic, nullable, readonly) NSString *customId;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithTokenString:(NSString *)tokenString expirationDate:(NSDate *)expirationDate creationDate:(NSDate *)creationDate rlm:(NSString *)rlm origin:(SNRTokenOrigin)origin uuid:(NSString *)uuid clientId:(NSString *)clientId customId:(nullable NSString *)customId NS_SWIFT_NAME(init(tokenString:expirationDate:creationDate:rlm:origin:uuid:clientId:customId:));

@end

NS_ASSUME_NONNULL_END
