//
//  SNRSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRNotificationsSettings.h"
#import "SNRTrackerSettings.h"
#import "SNRInjectorSettings.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRSettings
 */

NS_SWIFT_NAME(Settings)
@interface SNRSettings : NSObject

@property (strong, nonatomic, nonnull, readonly) SNRNotificationsSettings *notifications;

@property (strong, nonatomic, nonnull, readonly) SNRTrackerSettings *tracker;
@property (strong, nonatomic, nonnull, readonly) SNRInjectorSettings *injector;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

@end

NS_ASSUME_NONNULL_END
