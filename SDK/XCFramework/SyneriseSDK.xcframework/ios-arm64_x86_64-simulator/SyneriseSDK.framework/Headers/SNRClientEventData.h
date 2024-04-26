//
//  SNRClientEventData.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientEventData
 */

NS_SWIFT_NAME(ClientEventData)
@interface SNRClientEventData : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *time;
@property (copy, nonatomic, nonnull, readonly) NSString *label;
@property (copy, nonatomic, nonnull, readonly) NSString *action;

@property (copy, nonatomic, nonnull, readonly) NSDictionary *client;
@property (copy, nonatomic, nonnull, readonly) NSDictionary *params;

- (NSInteger)getClientID;
- (nullable NSString *)getClientUUIDString;
- (nullable NSString *)getClientEmail;

@end

NS_ASSUME_NONNULL_END
