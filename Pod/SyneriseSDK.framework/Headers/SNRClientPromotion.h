// 
//  SNRClientPromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRPromotion.h"

/**
 * @enum SNRClientPromotionStatus
 */
typedef NS_ENUM(NSInteger, SNRClientPromotionStatus) {
    SNRClientPromotionStatusActive = 0,
    SNRClientPromotionStatusAssigned,
    SNRClientPromotionStatusRedeemed
} NS_SWIFT_NAME(ClientPromotionStatus);

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientPromotion)
@interface SNRClientPromotion : SNRPromotion

@property (copy, nonatomic, nonnull, readonly) NSString *uuid;
@property (copy, nonatomic, nonnull, readonly) NSString *code;
@property (assign, nonatomic, readonly) SNRClientPromotionStatus status;
@property (assign, nonatomic, readonly) SNRPromotionType type;

@property (copy, nonatomic, nullable, readonly) NSNumber *redeemLimitPerClient;
@property (copy, nonatomic, nullable, readonly) NSNumber *currentRedeemedQuantity;
@property (assign, nonatomic, readonly) SNRPromotionDiscountType discountType;
@property (copy, nonatomic, nonnull, readonly) NSNumber *discountValue;
@property (copy, nonatomic, nullable, readonly) NSNumber *requireRedeemedPoints;

@property (copy, nonatomic, nonnull, readonly) NSString *name;
@property (copy, nonatomic, nullable, readonly) NSString *headline;
@property (copy, nonatomic, nullable, readonly) NSString *descriptionText;
@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *images;

@property (copy, nonatomic, nullable, readonly) NSDate *startAt;
@property (copy, nonatomic, nullable, readonly) NSDate *expireIn;
@property (copy, nonatomic, nullable, readonly) NSNumber *lastingAt;

@property (copy, nonatomic, nullable, readonly) NSDictionary *params;
@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *catalogIndexItems;
@property (copy, nonatomic, nullable, readonly) NSNumber *price;

+ (NSString *)NSStringFromClientPromotionStatus:(SNRClientPromotionStatus)clientPromotionStatus NS_SWIFT_NAME(stringFromClientPromotionStatus(_:));
+ (SNRClientPromotionStatus)clientPromotionStatusFromNSString:(NSString *)string NS_SWIFT_NAME(clientPromotionStatusFromString(_:));

@end

NS_ASSUME_NONNULL_END
