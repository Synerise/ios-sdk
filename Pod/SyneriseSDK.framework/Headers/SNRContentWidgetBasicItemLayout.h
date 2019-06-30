//
//  SNRContentWidgetBasicItemLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRContentWidgetItemLayout.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetBasicItemLayout
 */

NS_SWIFT_NAME(ContentWidgetBasicItemLayout)
@interface SNRContentWidgetBasicItemLayout : SNRContentWidgetItemLayout

@property (assign, nonatomic, readwrite) CGFloat imageWidthRatio;
@property (assign, nonatomic, readwrite) CGFloat imageHeightRatio;
@property (copy, nonatomic, nonnull, readwrite) UIColor *imageBackground;

@property (assign, nonatomic, readwrite) UIEdgeInsets titleInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *titleFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *titleFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment titleAlignment;

@property (assign, nonatomic, readwrite) UIEdgeInsets priceInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *priceFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *priceFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment priceAlignment;

@end

NS_ASSUME_NONNULL_END
