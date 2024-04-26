//
//  SNRScreenView.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRScreenViewAudienceInfo.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRScreenView
 */

NS_SWIFT_NAME(ScreenView)
@interface SNRScreenView : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *identifier;
@property (copy, nonatomic, nonnull, readonly) NSString *name;
@property (copy, nonatomic, nonnull, readonly) NSString *hashString;
@property (copy, nonatomic, nonnull, readonly) NSString *path;
@property (assign, nonatomic, readonly) NSInteger priority;
@property (copy, nonatomic, nullable, readonly) SNRScreenViewAudienceInfo *audience;

@property (copy, nonatomic, nullable, readonly) id data;

@property (copy, nonatomic, nonnull, readonly) NSDate *createdAt;
@property (copy, nonatomic, nonnull, readonly) NSDate *updatedAt;

@end

NS_ASSUME_NONNULL_END
