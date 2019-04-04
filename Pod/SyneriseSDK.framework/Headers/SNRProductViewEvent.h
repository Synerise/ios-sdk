//
//  SNRProductViewEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNREvent.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRProductViewEvent
 *
 * Represents a 'client viewed product' event.
 */

NS_SWIFT_NAME(ProductViewEvent)
@interface SNRProductViewEvent : SNREvent

- (instancetype)initWithLabel:(NSString *)label
                          productName:(NSString *)productName
                   productId:(NSString *)productId
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:productName:productId:params:));

- (void)setIsRecommended:(BOOL)isRecommended;
- (void)setCategory:(NSString *)category;
- (void)setURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
