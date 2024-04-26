//
//  SNRScreenViewAudienceInfo.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRScreenViewAudienceInfo
 */

NS_SWIFT_NAME(ScreenViewAudienceInfo)
@interface SNRScreenViewAudienceInfo : SNRBaseModel

@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *segments;
@property (copy, nonatomic, nullable, readonly) NSString *query;
@property (copy, nonatomic, nullable, readonly) NSString *targetType;

@end

NS_ASSUME_NONNULL_END
