//
//  SNRRecommendationClickEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRRecommendationEvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationClickEvent
 *
 * Represents a 'client clicked recommendation' event.
 */

NS_SWIFT_NAME(RecommendationClickEvent)
@interface SNRRecommendationClickEvent : SNRRecommendationEvent

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
