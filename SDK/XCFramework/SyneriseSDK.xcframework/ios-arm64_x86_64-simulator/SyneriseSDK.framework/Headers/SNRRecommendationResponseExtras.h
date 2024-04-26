//
//  SNRRecommendationResponseExtras.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRRecommendation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationResponseExtras
 */

NS_SWIFT_NAME(RecommendationResponseExtras)
@interface SNRRecommendationResponseExtras : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSArray<SNRRecommendation *> *contextItems;
@property (strong, nonatomic, nonnull, readonly) NSString *correlationId;
@property (strong, nonatomic, nonnull, readonly) NSArray *slots;

@end

NS_ASSUME_NONNULL_END
