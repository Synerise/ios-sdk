//
//  SNRContentWidgetItemLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRContentWidgetPriceCurrencyPosition
 */

typedef NS_ENUM(NSUInteger, SNRContentWidgetPriceCurrencyPosition) {
    SNRContentWidgetPriceCurrencyPositionLeft = 0,
    SNRContentWidgetPriceCurrencyPositionRight
} NS_SWIFT_NAME(ContentWidgetPriceCurrencyPosition);

/**
 * @class SNRContentWidgetItemLayout
 *
 * @note This is an abstract class and it is not meant to be instantiated directly. You should use concrete SNRContentWidgetItemLayout subclasses instead.
 */

NS_SWIFT_NAME(ContentWidgetItemLayout)
@interface SNRContentWidgetItemLayout : NSObject

@property (copy, nonatomic, nonnull, readwrite) UIColor *backgroundColor;

@property (assign, nonatomic, readwrite) CGFloat cornerRadius;
@property (assign, nonatomic, readwrite) CGFloat borderWidth;
@property (copy, nonatomic, nonnull, readwrite) UIColor *borderColor;
@property (copy, nonatomic, nonnull, readwrite) UIColor *shadowColor;

@end

NS_ASSUME_NONNULL_END
