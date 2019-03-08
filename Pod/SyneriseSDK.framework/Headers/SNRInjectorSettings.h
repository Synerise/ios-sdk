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

//This parameter specifies that Injector starts automatically.
//
//Automatic is false by default.
@property (assign, nonatomic, readwrite) BOOL automatic;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

@end

NS_ASSUME_NONNULL_END
