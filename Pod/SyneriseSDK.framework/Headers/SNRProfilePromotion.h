// 
//  SNRProfilePromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRPromotion.h"

/**
 * @enum SNRProfilePromotionStatus
 */
typedef NS_ENUM(NSInteger, SNRProfilePromotionStatus) {
    SNRProfilePromotionStatusPublish = 0,
    SNRProfilePromotionStatusDraft,
    SNRProfilePromotionStatusHidden
} NS_SWIFT_NAME(ProfilePromotionStatus);

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ProfilePromotion)
@interface SNRProfilePromotion : SNRPromotion

@property (copy, nonatomic, nonnull, readonly) NSString *uuid;
@property (copy, nonatomic, nonnull, readonly) NSString *code;
@property (assign, nonatomic, readonly) SNRProfilePromotionStatus status;
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
@property (copy, nonatomic, nullable, readonly) NSNumber *lastingTime;

@property (copy, nonatomic, nullable, readonly) NSDictionary *params;
@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *catalogIndexItems;
@property (copy, nonatomic, nullable, readonly) NSNumber *price;

+ (NSString *)NSStringFromProfilePromotionStatus:(SNRProfilePromotionStatus)profilePromotionStatus NS_SWIFT_NAME(stringFromProfilePromotionStatus(_:));
+ (SNRProfilePromotionStatus)profilePromotionStatusFromNSString:(NSString *)string NS_SWIFT_NAME(profilePromotionStatusFromString(_:));

@end

NS_ASSUME_NONNULL_END
