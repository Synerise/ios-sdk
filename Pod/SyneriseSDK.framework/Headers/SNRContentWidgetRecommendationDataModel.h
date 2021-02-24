//
//  SNRContentWidgetRecommendationDataModel.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetRecommendationDataModel
 */

NS_SWIFT_NAME(ContentWidgetRecommendationDataModel)
@interface SNRContentWidgetRecommendationDataModel : NSObject

@property (copy, nonatomic, nonnull, readwrite) NSURL *imageURL;
@property (copy, nonatomic, nonnull, readwrite) NSString *title;
@property (copy, nonatomic, nonnull, readwrite) NSString *priceCurrency;
@property (copy, nonatomic, nonnull, readwrite) NSNumber *priceValue;
@property (copy, nonatomic, nullable, readwrite) NSNumber *salePriceValue;

@end

NS_ASSUME_NONNULL_END
