//
//  SNRPromotionIdentifier.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionIdentifier
 */

NS_SWIFT_NAME(PromotionIdentifier)
@interface SNRPromotionIdentifier : SNRBaseModel

- (instancetype)initWithUUID:(NSString *)UUID;
- (instancetype)initWithCode:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
