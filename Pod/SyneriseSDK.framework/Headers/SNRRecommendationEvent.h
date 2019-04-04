//
//  SNRRecommendationEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNREvent.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(RecommendationEvent)
@interface SNRRecommendationEvent : SNREvent

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
