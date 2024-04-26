//
//  SNRPromotionResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRPromotionResponseMetadata.h>
#import <SyneriseSDK/SNRPromotion.h>

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
