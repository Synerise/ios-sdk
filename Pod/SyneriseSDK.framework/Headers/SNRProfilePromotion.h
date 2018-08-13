// 
//  SNRProfilePromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ProfilePromotion)
@interface SNRProfilePromotion : NSObject

@property (copy, nonatomic, nullable, readonly) NSNumber *promotionId;
@property (copy, nonatomic, nullable, readonly) NSString *uuid;
@property (copy, nonatomic, nullable, readonly) NSString *code;
@property (assign, nonatomic, readonly) BOOL isVisible;
@property (copy, nonatomic, nullable, readonly) NSString *status;
@property (copy, nonatomic, nullable, readonly) NSString *type;
@property (copy, nonatomic, nullable, readonly) NSNumber *redeemLimitPerClient;
@property (copy, nonatomic, nullable, readonly) NSNumber *redeemLimitGlobal;
@property (copy, nonatomic, nullable, readonly) NSNumber *currentRedeemedQuantity;
@property (copy, nonatomic, nullable, readonly) NSString *discountType;
@property (copy, nonatomic, nullable, readonly) NSString *discountValue;
@property (copy, nonatomic, nullable, readonly) NSString *preDiscountValue;
@property (copy, nonatomic, nullable, readonly) NSNumber *requireRedeemedPoints;
@property (copy, nonatomic, nullable, readonly) NSString *name;
@property (copy, nonatomic, nullable, readonly) NSString *headline;
@property (copy, nonatomic, nullable, readonly) NSString *descriptionText;
@property (copy, nonatomic, nullable, readonly) NSString *images; // json
@property (copy, nonatomic, nullable, readonly) NSDate *startAt;
@property (copy, nonatomic, nullable, readonly) NSDate *expireIn;
@property (copy, nonatomic, nullable, readonly) NSDate *lastingAt;
@property (copy, nonatomic, nullable, readonly) NSNumber *lastingTime;
@property (copy, nonatomic, nullable, readonly) NSString *catalog;
@property (copy, nonatomic, nullable, readonly) NSString *catalogIndexItems; // json
@property (copy, nonatomic, nullable, readonly) NSString *targetSegment; // json
@property (copy, nonatomic, nullable, readonly) NSString *customAudience; // json
@property (copy, nonatomic, nullable, readonly) NSString *params; // json
@property (copy, nonatomic, nullable, readonly) NSNumber *userId;
@property (copy, nonatomic, nullable, readonly) NSNumber *businessProfileId;

@end

NS_ASSUME_NONNULL_END
