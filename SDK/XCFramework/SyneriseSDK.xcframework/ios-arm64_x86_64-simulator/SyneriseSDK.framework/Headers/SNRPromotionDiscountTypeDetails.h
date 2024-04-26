//
//  SNRPromotionDiscountDetails.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionDiscountTypeDetails
 */

NS_SWIFT_NAME(PromotionDiscountTypeDetails)
@interface SNRPromotionDiscountTypeDetails : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *name;
@property (assign, nonatomic, readonly) BOOL outerScope;
@property (assign, nonatomic, readonly) NSInteger requiredItemsCount;
@property (assign, nonatomic, readonly) NSInteger discountedItemsCount;

@end

NS_ASSUME_NONNULL_END
