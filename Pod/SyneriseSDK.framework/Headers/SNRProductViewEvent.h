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

- (void)setSKU:(NSString *)sku;
- (void)setName:(NSString *)name;
- (void)setRecommended:(BOOL)isRecommended;
- (void)setCategory:(NSString *)category;
- (void)setURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
