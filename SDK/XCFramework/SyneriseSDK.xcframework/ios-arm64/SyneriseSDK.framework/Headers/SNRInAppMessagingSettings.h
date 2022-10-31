//
//  SNRInAppMessagingSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2022 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRInAppMessagingSettings
 */

NS_SWIFT_NAME(InAppMessagingSettings)
@interface SNRInAppMessagingSettings : NSObject

/**
 * This parameter sets a timeout for In-app message rendering.
 *
 * The default value is 5 seconds.
 */
@property (assign, nonatomic, readwrite) NSTimeInterval renderingTimeout;

@end

NS_ASSUME_NONNULL_END
