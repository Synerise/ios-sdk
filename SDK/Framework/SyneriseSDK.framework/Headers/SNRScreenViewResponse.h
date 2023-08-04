//
//  SNRScreenViewResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRScreenViewAudience.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRScreenViewResponse
 */

NS_SWIFT_NAME(ScreenViewResponse)
@interface SNRScreenViewResponse : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) SNRScreenViewAudience *audience;

@property (copy, nonatomic, nonnull, readonly) NSString *identifier;
@property (copy, nonatomic, nonnull, readonly) NSString *hashString;
@property (copy, nonatomic, nonnull, readonly) NSString *path;
@property (copy, nonatomic, nonnull, readonly) NSString *name;
@property (copy, nonatomic, nonnull, readonly) NSNumber *priority;
@property (copy, nonatomic, nullable, readonly) NSString *descriptionText;

@property (copy, nonatomic, nonnull, readonly) id data;

@property (copy, nonatomic, nonnull, readonly) NSString *version;
@property (copy, nonatomic, nullable, readonly) NSString *parentVersion;

@property (copy, nonatomic, nonnull, readonly) NSDate *createdAt;
@property (copy, nonatomic, nonnull, readonly) NSDate *updatedAt;
@property (copy, nonatomic, nullable, readonly) NSDate *deletedAt;

@end

NS_ASSUME_NONNULL_END
