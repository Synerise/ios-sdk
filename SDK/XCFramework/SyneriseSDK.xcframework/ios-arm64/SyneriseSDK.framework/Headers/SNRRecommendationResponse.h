//
//  SNRRecommendationResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRRecommendationResponseExtras.h>
#import <SyneriseSDK/SNRRecommendation.h>
#import <SyneriseSDK/SNRRecommendationResponseExtras.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationResponse
 */

NS_SWIFT_NAME(RecommendationResponse)
@interface SNRRecommendationResponse : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSString *name;
@property (strong, nonatomic, nonnull, readonly) NSString *campaignHash;
@property (strong, nonatomic, nonnull, readonly) NSString *campaignID;

@property (strong, nonatomic, nonnull, readonly) NSString *correlationID;
@property (strong, nonatomic, nonnull, readonly) NSString *schema;
@property (strong, nonatomic, nonnull, readonly) NSString *slug;
@property (strong, nonatomic, nonnull, readonly) NSString *UUID;

@property (strong, nonatomic, nonnull, readonly) SNRRecommendationResponseExtras *extras;

@property (strong, nonatomic, nonnull, readonly) NSArray<SNRRecommendation *> *items;

@end

NS_ASSUME_NONNULL_END
