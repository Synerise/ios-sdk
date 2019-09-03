//
//  SNRInjectorSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRInjectorSettings
 */

NS_SWIFT_NAME(InjectorSettings)
@interface SNRInjectorSettings : NSObject

//This parameter specifies that if Synerise Mobile Campaigns shall be treated automatically or not.
//
//Property is false by default.
@property (assign, nonatomic, readwrite) BOOL automatic;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
