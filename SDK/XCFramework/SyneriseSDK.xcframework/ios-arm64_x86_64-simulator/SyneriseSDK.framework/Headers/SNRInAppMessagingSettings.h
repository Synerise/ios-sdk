//
//  SNRInAppMessagingSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRInAppMessagingSettings
 */

NS_SWIFT_NAME(InAppMessagingSettings)
@interface SNRInAppMessagingSettings : NSObject

/**
 * This parameter sets the maximum interval between automatic In-app definition updates.
 * That minimum value for this parameter is 600 seconds (10 minutes).
 *
 * The default value is 600 seconds (10 minutes).
 */
@property (assign, nonatomic, readwrite) NSTimeInterval maxDefinitionUpdateIntervalLimit;

/**
 * This parameter sets a timeout for In-app message rendering.
 * That minimum value for this parameter is 1 second.
 *
 * The default value is 5 seconds.
 */
@property (assign, nonatomic, readwrite) NSTimeInterval renderingTimeout;

/**
 * This parameter specifies if the SDK should send the `inApp.capping` event.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL shouldSendInAppCappingEvent;

@end

NS_ASSUME_NONNULL_END
