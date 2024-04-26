//
//  SNRContentWidgetGridLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetLayout.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetGridLayout
 */

NS_SWIFT_NAME(ContentWidgetGridLayout)
@interface SNRContentWidgetGridLayout : SNRContentWidgetLayout

@property (assign, nonatomic, readwrite) CGFloat itemHorizontalSpacing;
@property (assign, nonatomic, readwrite) CGFloat itemVerticalSpacing;

/**
 * Gets content size of Widget for your given preferred width.
 */
- (CGSize)getSizeForPreferredWidth:(CGFloat)preferredWidth NS_SWIFT_NAME(getSize(preferredWidth:));

@end

NS_ASSUME_NONNULL_END
