//
//  SNRContentWidgetBasicProductItemLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetImageButtonCustomAction.h>
#import <SyneriseSDK/SNRContentWidgetBadgeItemLayoutPartial.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetBasicProductItemLayout
 */

NS_SWIFT_NAME(ContentWidgetBasicProductItemLayout)
@interface SNRContentWidgetBasicProductItemLayout : SNRContentWidgetItemLayout

@property (assign, nonatomic, readwrite) CGFloat imageWidthRatio;
@property (assign, nonatomic, readwrite) CGFloat imageHeightRatio;
@property (copy, nonatomic, nonnull, readwrite) UIColor *imageBackground;
@property (assign, nonatomic, readwrite) UIViewContentMode imageContentMode;

@property (assign, nonatomic, readwrite) UIEdgeInsets topTextInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *topTextFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *topTextFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment topTextAlignment;

@property (assign, nonatomic, readwrite) UIEdgeInsets titleInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *titleFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *titleFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment titleAlignment;

@property (assign, nonatomic, readwrite) UIEdgeInsets subtitleInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *subtitleFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *subtitleFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment subtitleAlignment;

@property (assign, nonatomic, readwrite) UIEdgeInsets identifierInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *identifierFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *identifierFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment identifierAlignment;

@property (assign, nonatomic, readwrite) UIEdgeInsets priceInsets;
@property (copy, nonatomic, nonnull, readwrite) UIFont *priceFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *priceFontColor;
@property (assign, nonatomic, readwrite) NSTextAlignment priceAlignment;

@property (copy, nonatomic, nullable, readwrite) NSString *priceGroupSeparator;
@property (copy, nonatomic, nullable, readwrite) NSString *priceDecimalSeparator;
@property (assign, nonatomic, readwrite) SNRContentWidgetPriceCurrencyPosition priceCurrencyPosition;

@property (assign, nonatomic, readwrite) BOOL isSalePriceVisible;
@property (assign, nonatomic, readwrite) UILayoutConstraintAxis salePriceOrientation;

@property (assign, nonatomic, readwrite) BOOL isDiscountPercentageVisible;
@property (copy, nonatomic, nonnull, readwrite) UIFont *discountPercentageFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *discountPercentageFontColor;

@property (copy, nonatomic, nullable, readwrite) UIFont *regularPriceFont;
@property (copy, nonatomic, nullable, readwrite) UIColor *regularPriceFontColor;

@property (copy, nonatomic, nullable, readwrite) UIFont *salePriceFont;
@property (copy, nonatomic, nullable, readwrite) UIColor *salePriceFontColor;

@property (assign, nonatomic, readwrite) UIEdgeInsets loyaltyPointsInsets;
@property (assign, nonatomic, readwrite) NSTextAlignment loyaltyPointsAlignment;
@property (copy, nonatomic, nonnull, readwrite) UIFont *loyaltyPointsNumberFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *loyaltyPointsNumberFontColor;
@property (copy, nonatomic, nonnull, readwrite) UIFont *loyaltyPointsTextFont;
@property (copy, nonatomic, nonnull, readwrite) UIColor *loyaltyPointsTextFontColor;
@property (copy, nonatomic, nullable, readwrite) NSString *loyaltyPointsText;


@property (strong, nonatomic, nonnull, readwrite) SNRContentWidgetBadgeItemLayoutPartial *badge;

@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetImageButtonCustomAction *actionButton;

@end

NS_ASSUME_NONNULL_END
