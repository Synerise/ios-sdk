//
//  SNRCartEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

@class SNRUnitPrice;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(CartEvent)
@interface SNRCartEvent : SNREvent

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
