//
//  SNRContentWidgetAppearance.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRContentWidgetLayout.h"

@class SNRContentWidgetLayout;
@class SNRContentWidgetItemLayout;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetAppearance
 */

NS_SWIFT_NAME(ContentWidgetAppearance)
@interface SNRContentWidgetAppearance : NSObject

@property (copy, nonatomic, nonnull, readwrite) UIColor *backgroundColor;

@property (strong, nonatomic, nonnull, readonly) SNRContentWidgetLayout *layout;
@property (strong, nonatomic, nonnull, readonly) SNRContentWidgetItemLayout *itemLayout;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)initWithLayout:(SNRContentWidgetLayout *)layout andItemLayout:(SNRContentWidgetItemLayout *)itemLayout NS_SWIFT_NAME(init(widgetLayout:itemLayout:));


@end

NS_ASSUME_NONNULL_END
