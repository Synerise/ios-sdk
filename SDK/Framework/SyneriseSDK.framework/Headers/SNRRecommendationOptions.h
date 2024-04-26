//
//  SNRRecommendationOptions.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRRecommendationFiltersJoinerRule
 */

typedef NS_ENUM(NSUInteger, SNRRecommendationFiltersJoinerRule) {
    SNRRecommendationFiltersJoinerRuleAnd,
    SNRRecommendationFiltersJoinerRuleOr,
    SNRRecommendationFiltersJoinerRuleReplace
} NS_SWIFT_NAME(RecommendationFiltersJoinerRule);

NSString * SNR_RecommendationFiltersJoinerRuleToString(SNRRecommendationFiltersJoinerRule rule);

/**
 * @class SNRRecommendationOptions
 */

NS_SWIFT_NAME(RecommendationOptions)
@interface SNRRecommendationOptions : NSObject

@property (copy, nonatomic, nullable, readonly) NSString *slug;
@property (copy, nonatomic, nullable, readwrite) NSString *productID;
@property (copy, nonatomic, nullable, readwrite) NSArray<NSString *> *productIDs;
@property (copy, nonatomic, nullable, readwrite) NSArray<NSString *> *itemsExcluded;

@property (copy, nonatomic, nullable, readwrite) NSString *additionalFilters;
@property (assign, nonatomic, readwrite) SNRRecommendationFiltersJoinerRule filtersJoiner;
@property (copy, nonatomic, nullable, readwrite) NSString *additionalElasticFilters;
@property (assign, nonatomic, readwrite) SNRRecommendationFiltersJoinerRule elasticFiltersJoiner;

@property (copy, nonatomic, nullable, readwrite) NSArray<NSString *> *displayAttribute;
@property (assign, nonatomic, readwrite) BOOL includeContextItems;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithSlug:(NSString *)slug;

@end

NS_ASSUME_NONNULL_END
