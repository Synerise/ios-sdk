//
//  SNRRecommendation.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendation
 */

NS_SWIFT_NAME(Recommendation)
@interface SNRRecommendation : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *gtin;
@property (copy, nonatomic, nonnull, readonly) NSString *productRetailerPartNo;

@property (copy, nonatomic, nonnull, readonly) NSString *title;
@property (copy, nonatomic, nonnull, readonly) NSString *brand;
@property (copy, nonatomic, nonnull, readonly) NSString *category;
@property (copy, nonatomic, nonnull, readonly) NSString *descriptionText;

@property (copy, nonatomic, nonnull, readonly) NSString *gender;
@property (copy, nonatomic, nonnull, readonly) NSString *color;
@property (copy, nonatomic, nonnull, readonly) NSArray<NSNumber *> *sizes;

@property (copy, nonatomic, nonnull, readonly) NSString *priceValue;
@property (copy, nonatomic, nonnull, readonly) NSString *effectivePriceValue;
@property (copy, nonatomic, nonnull, readonly) NSString *salePriceValue;
@property (copy, nonatomic, nonnull, readonly) NSString *priceCurrency;

@property (copy, nonatomic, nonnull, readonly) NSString *link;
@property (copy, nonatomic, nonnull, readonly) NSString *imageLink;
@property (copy, nonatomic, nonnull, readonly) NSArray<NSString *> *additionalImageLinks;
@property (copy, nonatomic, nonnull, readonly) NSDictionary *customAttributes;

@end

NS_ASSUME_NONNULL_END
