//
//  SNRRecommendationResponseExtrasSlot.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationResponseExtrasSlot
 */

NS_SWIFT_NAME(SNRRecommendationResponseExtrasSlot)
@interface SNRRecommendationResponseExtrasSlot : SNRBaseModel

@property (assign, nonatomic, readonly) NSInteger identifier;
@property (strong, nonatomic, nonnull, readonly) NSArray<NSString *> *itemIDs;
@property (strong, nonatomic, nonnull, readonly) NSString *name;
@property (strong, nonatomic, nullable, readonly) NSDictionary *error;

@end

NS_ASSUME_NONNULL_END
