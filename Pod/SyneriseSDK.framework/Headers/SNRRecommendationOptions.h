//
//  SNRRecommendationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SNRRecommendationOptions : SNRBaseModel

@property (copy, nonatomic, nullable, readwrite) NSString *slug;
@property (copy, nonatomic, nullable, readwrite) NSString *productID;

@end

NS_ASSUME_NONNULL_END
