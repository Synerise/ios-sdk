//
//  SNRProductViewEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRProductViewedEvent
 *
 * Represents a 'client viewed product' event.
 */

NS_SWIFT_NAME(ProductViewedEvent)
@interface SNRProductViewedEvent : SNREvent

- (instancetype)initWithLabel:(NSString *)label
                          productName:(NSString *)productName
                   productId:(NSString *)productId
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:productName:productId:params:));

- (instancetype)initWithLabel:(NSString *)label
                          productName:(NSString *)productName
                   productId:(NSString *)productId NS_SWIFT_NAME(init(label:productName:productId:));

- (void)setIsRecommended:(BOOL)isRecommended;
- (void)setCategory:(NSString *)category;
- (void)setURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
