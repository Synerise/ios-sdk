//
//  SNRTransactionEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

@class SNRUnitPrice;
@class SNREventProduct;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TransactionEvent)
@interface SNRTransactionEvent : SNREvent

- (void)setDiscountAmount:(SNRUnitPrice *)amount;
- (void)setDiscountCode:(NSString *)code;
- (void)setDiscountPercent:(float)percent;
- (void)setOrderId:(NSString *)orderId;
- (void)setOrderStatus:(NSString *)status;

- (void)setPaymentInfo:(id)paymentInfo;
- (void)setProducts:(NSArray <SNREventProduct *> *)products;
- (void)setRecordedAt:(NSDate *)recordedAt;
- (void)setRevenue:(SNRUnitPrice *)revenue;
- (void)setValue:(SNRUnitPrice *)value;

@end

NS_ASSUME_NONNULL_END
