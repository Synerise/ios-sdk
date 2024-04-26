//
//  SNRContentWidgetRecommendationDataModel.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetBadgeDataModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetRecommendationDataModel
 */

NS_SWIFT_NAME(ContentWidgetRecommendationDataModel)
@interface SNRContentWidgetRecommendationDataModel : NSObject

@property (copy, nonatomic, nonnull, readonly) NSURL *imageURL;
@property (copy, nonatomic, nullable, readwrite) NSString *topText;
@property (copy, nonatomic, nonnull, readonly) NSString *title;
@property (copy, nonatomic, nonnull, readwrite) NSString *subtitle;
@property (copy, nonatomic, nonnull, readwrite) NSString *identifier;
@property (copy, nonatomic, nonnull, readonly) NSString *priceCurrency;
@property (copy, nonatomic, nonnull, readonly) NSNumber *priceValue;
@property (copy, nonatomic, nullable, readwrite) NSNumber *salePriceValue;
@property (copy, nonatomic, nullable, readwrite) NSNumber *loyaltyPointsNumber;

@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetBadgeDataModel *badge;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithImageURL:(NSURL *)imageURL title:(NSString *)title priceCurrency:(NSString *)priceCurrency price:(NSNumber *)price salePrice:(nullable NSNumber *)salePrice NS_SWIFT_NAME(init(imageURL:title:priceCurrency:price:salePrice:));

@end

NS_ASSUME_NONNULL_END
