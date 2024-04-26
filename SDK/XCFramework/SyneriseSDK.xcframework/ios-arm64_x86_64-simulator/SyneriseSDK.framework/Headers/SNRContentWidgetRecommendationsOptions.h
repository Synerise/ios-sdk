//
//  SNRContentWidgetRecommendationsOptions.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetOptions.h>
#import <SyneriseSDK/SNRContentWidgetRecommendationDataModel.h>

@class SNRRecommendation;

typedef SNRContentWidgetRecommendationDataModel * _Nullable (^ContentWidgetRecommendationsOptionsMappingBlock)(SNRRecommendation * _Nonnull model);

/**
 * @enum SNRContentWidgetPriceCurrencyPosition
 */

typedef NS_ENUM(NSUInteger, SNRContentWidgetRecommendationEventType) {
    SNRContentWidgetRecommendationEventTypeSeen = 0,
    SNRContentWidgetRecommendationEventTypeView
} NS_SWIFT_NAME(ContentWidgetRecommendationEventType);

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetRecommendationsOptions
 */

NS_SWIFT_NAME(ContentWidgetRecommendationsOptions)
@interface SNRContentWidgetRecommendationsOptions : SNRContentWidgetOptions

@property (copy, nonatomic, nullable, readwrite) NSString *slug;
@property (copy, nonatomic, nullable, readwrite) NSString *productID;

@property (assign, nonatomic, readwrite) SNRContentWidgetRecommendationEventType recommendationEventType;

@property (copy, nonatomic, nonnull, readwrite) ContentWidgetRecommendationsOptionsMappingBlock mapping;

@end

NS_ASSUME_NONNULL_END
