//
//  SNRRecommendationViewEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRRecommendationEvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationViewEvent
 *
 * Represents a 'client viewed recommendation' event.
 */

NS_SWIFT_NAME(RecommendationViewEvent)
@interface SNRRecommendationViewEvent : SNRRecommendationEvent

- (instancetype)initWithLabel:(NSString *)label
                   campaignID:(NSString *)campaignID
                   campaignHash:(NSString *)campaignHash
                   correlationId:(NSString *)correlationId
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:campaignID:campaignHash:correlationId:params:));

- (instancetype)initWithLabel:(NSString *)label
                        items:(nullable NSArray<NSString *> *)items
                   campaignID:(NSString *)campaignID
                   campaignHash:(NSString *)campaignHash
                   correlationId:(NSString *)correlationId
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:items:campaignID:campaignHash:correlationId:params:));

- (void)setItems:(NSArray<NSString *> *)items;

@end

NS_ASSUME_NONNULL_END
