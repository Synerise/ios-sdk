//
//  SNRGeneralSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRGeneralSettings
 */

NS_SWIFT_NAME(GeneralSettings)
@interface SNRGeneralSettings : NSObject

@property (assign, nonatomic, readwrite) BOOL enabled;

//This parameter sets time interval counting backwards from expiration time, within which token will be automatically refreshed by SDK.
//Note, that minimum value for this parameter is 1800 seconds (30 minutes).
//
//Minimum Token Refresh Interval is 1800 seconds (30 minutes) by default.
@property (assign, nonatomic, readwrite) NSTimeInterval minTokenRefreshInterval;

@end

NS_ASSUME_NONNULL_END
