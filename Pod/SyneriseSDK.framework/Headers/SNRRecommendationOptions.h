//
//  SNRRecommendationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendationOptions
 */

NS_SWIFT_NAME(RecommendationOptions)
@interface SNRRecommendationOptions : NSObject

@property (copy, nonatomic, nullable, readonly) NSString *slug;
@property (copy, nonatomic, nullable, readwrite) NSString *productID;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithSlug:(NSString *)slug;

@end

NS_ASSUME_NONNULL_END
