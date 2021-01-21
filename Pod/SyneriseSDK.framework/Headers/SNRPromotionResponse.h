//
//  SNRPromotionResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

@class SNRPromotionResponseMetadata;
@class SNRPromotion;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionResponse
 */

NS_SWIFT_NAME(PromotionResponse)
@interface SNRPromotionResponse : SNRBaseModel

@property (strong, nonatomic, nullable, readonly) SNRPromotionResponseMetadata *metadata;
@property (strong, nonatomic, nonnull, readonly) NSArray<SNRPromotion *> *items;

@end

NS_ASSUME_NONNULL_END
