//
//  SNRInjectorSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRInjectorSettings
 */

NS_SWIFT_NAME(InjectorSettings)
@interface SNRInjectorSettings : NSObject

/**
 * This parameter specifies if Synerise Mobile Campaigns are processed automatically or not.
 *
 * The default value is false.
 */
@property (assign, nonatomic, readwrite) BOOL automatic;

@end

NS_ASSUME_NONNULL_END
