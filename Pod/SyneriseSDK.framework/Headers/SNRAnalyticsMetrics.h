//
//  SNRAnalyticsMetrics.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_SWIFT_NAME(AnalyticsMetrics)
@interface SNRAnalyticsMetrics : NSObject

@property (nullable, nonatomic, copy, readonly) NSNumber *result;
@property (nullable, nonatomic, copy, readonly) NSArray<NSNumber*> *clientMetrics;
@property (nullable, nonatomic, copy, readonly) NSArray<NSNumber*> *eventMetrics;
@property (nullable, nonatomic, copy, readonly) NSArray<NSNumber*> *numberMetrics;
@property (nullable, nonatomic, copy, readonly) NSDictionary *metricData;

@end
