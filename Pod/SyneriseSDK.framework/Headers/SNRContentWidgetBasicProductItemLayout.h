//
//  SNRContentWidgetBasicProductItemLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRContentWidgetItemLayout.h"
#import "SNRContentWidgetImageButtonCustomAction.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetBasicProductItemLayout
 */

NS_SWIFT_NAME(ContentWidgetBasicProductItemLayout)
@interface SNRContentWidgetBasicProductItemLayout : SNRContentWidgetItemLayout

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

@property (assign, nonatomic, readwrite) BOOL isSalePriceVisible;
@property (assign, nonatomic, readwrite) UILayoutConstraintAxis salePriceOrientation;
@property (assign, nonatomic, readwrite) CGFloat salePriceMargin;
@property (copy, nonatomic, nonnull, readwrite) UIFont *salePriceFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *salePriceFontColor;

@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetImageButtonCustomAction *actionButton;
@property (assign, nonatomic, readwrite) CGPoint actionButtonPosition;

@end

NS_ASSUME_NONNULL_END
