//
//  SNRNotificationServiceSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationsSettings
 */

NS_SWIFT_NAME(NotificationsSettings)
@interface SNRNotificationsSettings : NSObject

@property (assign, nonatomic, readwrite) BOOL disableInAppAlerts;
@property (copy, nonatomic, nullable, readwrite) NSString *appGroupIdentifier;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

@end

NS_ASSUME_NONNULL_END
