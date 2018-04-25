//
//  SNRCartEvent.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

@class SNRUnitPrice;

NS_SWIFT_NAME(CartEvent)
@interface SNRCartEvent : SNREvent

- (nonnull instancetype)initWithLabel:(NSString * _Nonnull)label
                                  sku:(NSString * _Nonnull)sku
                           finalPrice:(SNRUnitPrice * _Nonnull)unitPrice
                             quantity:(NSInteger)quantity
                            andParams:(SNRTrackerParams * _Nullable)params NS_SWIFT_NAME(init(label:sku:finalPrice:quantity:params:));

- (nonnull instancetype)initWithLabel:(NSString * _Nonnull)label
                                  sku:(NSString * _Nonnull)sku
                           finalPrice:(SNRUnitPrice * _Nonnull)unitPrice
                             quantity:(NSInteger)quantity NS_SWIFT_NAME(init(label:sku:finalPrice:quantity:));

- (void)setName:(NSString * _Nonnull)name;
- (void)setCategory:(NSString * _Nonnull)category;
- (void)setCategories:(NSArray<NSString *> * _Nonnull)categories;
- (void)setOffline:(BOOL)isOffline;
- (void)setRegularPrice:(SNRUnitPrice * _Nonnull)price;
- (void)setDiscountedPrice:(SNRUnitPrice * _Nonnull)price;
- (void)setURL:(NSURL * _Nonnull)url;
- (void)setProducer:(NSString * _Nonnull)producer;

@end
