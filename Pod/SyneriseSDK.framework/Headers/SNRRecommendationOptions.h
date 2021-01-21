//
//  SNRRecommendationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationOptions
 */

NS_SWIFT_NAME(RecommendationOptions)
@interface SNRRecommendationOptions : SNRBaseModel

@property (copy, nonatomic, nullable, readwrite) NSString *slug;
@property (copy, nonatomic, nullable, readwrite) NSString *productID;

@end

NS_ASSUME_NONNULL_END
