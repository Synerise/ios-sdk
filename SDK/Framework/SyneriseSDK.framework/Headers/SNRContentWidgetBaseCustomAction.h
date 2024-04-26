//
//  SNRContentWidgetBaseCustomAction.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SNRContentWidgetBaseCustomActionPredefiniedActionType) {
    SNRContentWidgetBaseCustomActionPredefiniedActionTypeNone = 0,
    SNRContentWidgetBaseCustomActionPredefiniedActionTypeSendLikeEvent
} NS_SWIFT_NAME(ContentWidgetBaseCustomActionPredefiniedActionType);

NS_SWIFT_NAME(ContentWidgetBaseCustomAction)
@interface SNRContentWidgetBaseCustomAction : NSObject

@property (assign, nonatomic, readwrite) SNRContentWidgetBaseCustomActionPredefiniedActionType predefinedActionType;

@end

NS_ASSUME_NONNULL_END
