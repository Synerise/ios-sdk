//
//  SNRAppearedInLocationEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRAppearedInLocationEvent
 *
 * Represents a 'client appeared in location' event.
 */

NS_SWIFT_NAME(AppearedInLocationEvent)
@interface SNRAppearedInLocationEvent : SNREvent

- (nonnull instancetype)initWithLabel:(nonnull NSString *)label andParams:(nullable SNRTrackerParams *)params __attribute__((unavailable("Use initWithLabel:andLocation:andParams instead")));
- (nonnull instancetype)initWithLabel:(nonnull NSString *)label __attribute__((unavailable("Use initWithLabel:andLocation instead")));

/**
 Initializes @c SNRAppearedInLocationEvent object with provided location and label;

 @param label event label.
 @param location @c CLLocation object representing client's location.
 @return initialized @c SNRAppearedInLocationEvent object.
 */
- (instancetype)initWithLabel:(NSString *)label
                          andLocation:(CLLocation *)location NS_SWIFT_NAME(init(label:location:));

/**
 Initializes @c SNRAppearedInLocationEvent object with provided location, label and optional @c SNRTrackerParams object;

 @param label event label.
 @param location @c CLLocation object representing client's location.
 @param params @c SNTRackerParams object.
 @return initialized @c SNRAppearedInLocationEvent object.
 */
- (instancetype)initWithLabel:(NSString *)label
                          andLocation:(CLLocation *)location
                            andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:location:params:));

@end

NS_ASSUME_NONNULL_END
