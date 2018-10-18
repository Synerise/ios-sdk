//
//  SNRAnalyticsMetrics.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(AnalyticsMetrics)
@interface SNRAnalyticsMetrics : SNRBaseModel

@property (copy, nonatomic, nullable, readonly) NSNumber *result;
@property (copy, nonatomic, nullable, readonly) NSArray<NSNumber *> *clientMetrics;
@property (copy, nonatomic, nullable, readonly) NSArray<NSNumber *> *eventMetrics;
@property (copy, nonatomic, nullable, readonly) NSArray<NSNumber *> *numberMetrics;
@property (copy, nonatomic, nullable, readonly) NSDictionary *metricData;

@end

NS_ASSUME_NONNULL_END
