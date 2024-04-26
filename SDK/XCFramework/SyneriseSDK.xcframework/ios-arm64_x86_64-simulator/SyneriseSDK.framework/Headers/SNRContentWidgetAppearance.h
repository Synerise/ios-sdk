//
//  SNRContentWidgetAppearance.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetLayout.h>
#import <SyneriseSDK/SNRContentWidgetItemLayout.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetAppearance
 */

NS_SWIFT_NAME(ContentWidgetAppearance)
@interface SNRContentWidgetAppearance : NSObject

@property (copy, nonatomic, nonnull, readwrite) UIColor *backgroundColor;

@property (strong, nonatomic, nonnull, readonly) SNRContentWidgetLayout *layout;
@property (strong, nonatomic, nonnull, readonly) SNRContentWidgetItemLayout *itemLayout;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithLayout:(SNRContentWidgetLayout *)layout andItemLayout:(SNRContentWidgetItemLayout *)itemLayout NS_SWIFT_NAME(init(widgetLayout:itemLayout:));


@end

NS_ASSUME_NONNULL_END
