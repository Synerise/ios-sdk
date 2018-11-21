//
//  SNRPromotionResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

@class SNRPromotion;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionResponse
 */

NS_SWIFT_NAME(PromotionResponse)
@interface SNRPromotionResponse : SNRBaseModel

@property (assign, nonatomic, readonly) NSInteger totalCount;
@property (assign, nonatomic, readonly) NSInteger totalPages;
@property (assign, nonatomic, readonly) NSInteger page;
@property (assign, nonatomic, readonly) NSInteger limit;
@property (strong, nonatomic, nonnull, readonly) NSDictionary *meta;

@property (strong, nonatomic, nonnull, readonly) NSArray<SNRPromotion *> *items;

@end

NS_ASSUME_NONNULL_END
