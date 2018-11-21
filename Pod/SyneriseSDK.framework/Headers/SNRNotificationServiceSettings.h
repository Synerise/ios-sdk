//
//  SNRNotificationServiceSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationServiceSettings
 */

NS_SWIFT_NAME(NotificationServiceSettings)
@interface SNRNotificationServiceSettings : NSObject

@property (assign, nonatomic, readwrite) BOOL disableInAppAlerts;
@property (copy, nonatomic, nullable, readwrite) NSString *appGroupIdentifier;

+ (SNRNotificationServiceSettings *)sharedInstance NS_SWIFT_NAME(shared());

@end

NS_ASSUME_NONNULL_END
