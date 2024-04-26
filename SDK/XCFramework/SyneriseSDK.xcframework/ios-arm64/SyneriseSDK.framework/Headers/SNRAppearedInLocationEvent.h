//
//  SNRAppearedInLocationEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRAppearedInLocationEvent
 *
 * Represents a 'client appeared in location' event.
 */

NS_SWIFT_NAME(AppearedInLocationEvent)
@interface SNRAppearedInLocationEvent : SNREvent

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithLabel:(nonnull NSString *)label andParams:(nullable SNRTrackerParams *)params NS_UNAVAILABLE;
- (instancetype)initWithLabel:(nonnull NSString *)label NS_UNAVAILABLE;

- (instancetype)initWithLabel:(NSString *)label andLocation:(CLLocation *)location NS_SWIFT_NAME(init(label:location:));
- (instancetype)initWithLabel:(NSString *)label andLocation:(CLLocation *)location andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:location:params:));

@end

NS_ASSUME_NONNULL_END
