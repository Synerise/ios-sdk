// 
//  SNRClientPromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientPromotion)
@interface SNRClientPromotion : NSObject

@property (copy, nonatomic, nullable, readonly) NSString *uuid;
@property (copy, nonatomic, nullable, readonly) NSString *code;
@property (copy, nonatomic, nullable, readonly) NSString *status;
@property (copy, nonatomic, nullable, readonly) NSString *type;
@property (assign, nonatomic, readonly) BOOL isVisible;
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
@property (copy, nonatomic, nullable, readonly) NSString *images;
@property (copy, nonatomic, nullable, readonly) NSDate *startAt;
@property (copy, nonatomic, nullable, readonly) NSDate *expireIn;
@property (copy, nonatomic, nullable, readonly) NSDate *lastingAt;
@property (copy, nonatomic, nullable, readonly) NSDate *deletedAt;
@property (copy, nonatomic, nullable, readonly) NSNumber *lastingTime;
@property (copy, nonatomic, nullable, readonly) NSString *catalog;
@property (copy, nonatomic, nullable, readonly) NSString *catalogIndexItems;
@property (copy, nonatomic, nullable, readonly) NSString *targetSegment;
@property (copy, nonatomic, nullable, readonly) NSString *customAudience;
@property (copy, nonatomic, nullable, readonly) NSString *params;
@property (copy, nonatomic, nullable, readonly) NSNumber *userId;


@end

NS_ASSUME_NONNULL_END
