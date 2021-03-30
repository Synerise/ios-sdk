//
//  SNRScreenViewAudience.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRScreenViewAudience
 */

NS_SWIFT_NAME(ScreenViewAudience)
@interface SNRScreenViewAudience : SNRBaseModel

@property (copy, nonatomic, nullable, readonly) NSArray *IDs;
@property (copy, nonatomic, nullable, readonly) NSString *query;

@end

NS_ASSUME_NONNULL_END
