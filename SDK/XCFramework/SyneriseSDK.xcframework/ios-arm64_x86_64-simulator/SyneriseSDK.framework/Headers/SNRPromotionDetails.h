//
//  SNRPromotionDetails.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRPromotionDiscountTypeDetails.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionDetails
 */

NS_SWIFT_NAME(PromotionDetails)
@interface SNRPromotionDetails : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) SNRPromotionDiscountTypeDetails *discountType;

@end

NS_ASSUME_NONNULL_END
