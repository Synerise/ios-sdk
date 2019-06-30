//
//  SNRRecommendationResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"
#import "SNRRecommendation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationResponse
 */

NS_SWIFT_NAME(RecommendationResponse)
@interface SNRRecommendationResponse : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSString *name;
@property (strong, nonatomic, nonnull, readonly) NSString *campaignHash;
@property (strong, nonatomic, nonnull, readonly) NSString *campaignID;

@property (strong, nonatomic, nonnull, readonly) NSArray<SNRRecommendation *> *items;

@end

NS_ASSUME_NONNULL_END
