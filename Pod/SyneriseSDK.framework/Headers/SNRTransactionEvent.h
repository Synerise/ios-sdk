//
//  SNRTransactionEvent.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

@class SNRUnitPrice;
@class SNREventProduct;

/**
 Base class for transaction related events.
 */

NS_SWIFT_NAME(TransactionEvent)
@interface SNRTransactionEvent : SNREvent

- (void)setDiscountAmount:(nonnull SNRUnitPrice *)amount;
- (void)setDiscountCode:(nonnull NSString *)code;
- (void)setDiscountPercent:(float)percent;
- (void)setOrderId:(nonnull NSString *)orderId;
- (void)setOrderStatus:(nonnull NSString *)status;

/**
 Sets Payment info.

 @attention Raises an @c NSInvalidArgumentException if object is not JSON encodable.
 @param paymentInfo payment info.
 */
- (void)setPaymentInfo:(nonnull id)paymentInfo;
- (void)setProducts:(nonnull NSArray <SNREventProduct *>*)products;
- (void)setRecordedAt:(nonnull NSDate *)recordedAt;
- (void)setRevenue:(nonnull SNRUnitPrice *)revenue;
- (void)setValue:(nonnull SNRUnitPrice *)value;

@end
