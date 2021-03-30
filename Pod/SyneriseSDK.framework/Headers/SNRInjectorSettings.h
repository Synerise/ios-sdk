//
//  SNRInjectorSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
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

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
