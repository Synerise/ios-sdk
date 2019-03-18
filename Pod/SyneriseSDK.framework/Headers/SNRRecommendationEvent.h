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

- (void)setSKU:(NSString *)sku;
- (void)setName:(NSString *)name;
- (void)setCategory:(NSString *)category;
- (void)setURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
