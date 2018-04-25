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

- (void)setDiscountAmount:(SNRUnitPrice * _Nonnull)amount;
- (void)setDiscountCode:(NSString * _Nonnull)code;
- (void)setDiscountPercent:(float)percent;
- (void)setOrderId:(NSString * _Nonnull)orderId;
- (void)setOrderStatus:(NSString * _Nonnull)status;

/**
 Sets Payment info.

 @attention Raises an @c NSInvalidArgumentException if object is not JSON encodable.
 @param paymentInfo payment info.
 */
- (void)setPaymentInfo:(id _Nonnull)paymentInfo;
- (void)setProducts:(NSArray <SNREventProduct *>* _Nonnull)products;
- (void)setRecordedAt:(NSDate * _Nonnull)recordedAt;
- (void)setRevenue:(SNRUnitPrice * _Nonnull)revenue;
- (void)setValue:(SNRUnitPrice * _Nonnull)value;

@end
