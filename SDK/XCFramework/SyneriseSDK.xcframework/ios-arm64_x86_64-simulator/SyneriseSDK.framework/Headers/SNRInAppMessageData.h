//
//  SNRInAppMessageData.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRInAppMessageData
 */

NS_SWIFT_NAME(InAppMessageData)
@interface SNRInAppMessageData : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSString *campaignHash;
@property (strong, nonatomic, nonnull, readonly) NSString *variantIdentifier;
@property (strong, nonatomic, nullable, readonly) NSDictionary<NSString *, NSString *> *additionalParameters;

@property (assign, nonatomic, readonly) BOOL isTest;

@end

NS_ASSUME_NONNULL_END
