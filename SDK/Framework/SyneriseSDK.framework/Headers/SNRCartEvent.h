//
//  SNRCartEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>

@class SNRUnitPrice;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCartEvent
 *
 * Represents a base class for cart events.
 *
 * @note This is an abstract class and it is not meant to be instantiated directly. You should use concrete `SNRCartEvent` subclasses instead.
 */

NS_SWIFT_NAME(CartEvent)
@interface SNRCartEvent : SNREvent

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithLabel:(nonnull NSString *)label andParams:(nullable SNRTrackerParams *)params NS_UNAVAILABLE;
- (instancetype)initWithLabel:(nonnull NSString *)label NS_UNAVAILABLE;

- (instancetype)initWithLabel:(NSString *)label
                                  sku:(NSString *)sku
                           finalPrice:(SNRUnitPrice *)unitPrice
                             quantity:(NSInteger)quantity
                            andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:sku:finalPrice:quantity:params:));

- (instancetype)initWithLabel:(NSString *)label
                                  sku:(NSString *)sku
                           finalPrice:(SNRUnitPrice *)unitPrice
                             quantity:(NSInteger)quantity NS_SWIFT_NAME(init(label:sku:finalPrice:quantity:));

- (void)setName:(NSString *)name;
- (void)setCategory:(NSString *)category;
- (void)setCategories:(NSArray<NSString *> *)categories;
- (void)setOffline:(BOOL)isOffline;
- (void)setRegularPrice:(SNRUnitPrice *)price;
- (void)setDiscountedPrice:(SNRUnitPrice *)price;
- (void)setURL:(NSURL *)url;
- (void)setProducer:(NSString *)producer;

@end

NS_ASSUME_NONNULL_END
