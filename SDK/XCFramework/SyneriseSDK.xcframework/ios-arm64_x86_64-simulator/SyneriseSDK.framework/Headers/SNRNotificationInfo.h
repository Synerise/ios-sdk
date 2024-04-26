//
//  SNRNotificationInfo.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationInfo
 */

NS_SWIFT_NAME(NotificationInfo)
@interface SNRNotificationInfo : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *campaignHashId;
@property (copy, nonatomic, nonnull, readonly) NSString *campaignTitle;

@property (copy, nonatomic, nonnull, readonly) NSDictionary *payload;

@end

NS_ASSUME_NONNULL_END
