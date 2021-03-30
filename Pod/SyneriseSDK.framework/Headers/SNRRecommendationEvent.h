//
//  SNRRecommendationEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationEvent
 *
 * Represents a base class for recommendation events.
 *
 * @note This is an abstract class and it is not meant to be instantiated directly. You should use concrete `SNRRecommendationEvent` subclasses instead.
 */

NS_SWIFT_NAME(RecommendationEvent)
@interface SNRRecommendationEvent : SNREvent

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithLabel:(nonnull NSString *)label andParams:(nullable SNRTrackerParams *)params NS_UNAVAILABLE;
- (instancetype)initWithLabel:(nonnull NSString *)label NS_UNAVAILABLE;

- (instancetype)initWithLabel:(NSString *)label
                  productName:(NSString *)productName
                    productId:(NSString *)productId
                   campaignID:(NSString *)campaignID
                 campaignHash:(NSString *)campaignHash
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:productName:productId:campaignID:campaignHash:params:));

- (void)setCategory:(NSString *)category;
- (void)setURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
