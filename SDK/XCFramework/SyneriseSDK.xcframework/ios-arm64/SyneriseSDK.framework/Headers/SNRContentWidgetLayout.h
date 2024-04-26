//
//  SNRContentWidgetLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetLayout
 *
 * @note This is an abstract class and it is not meant to be instantiated directly. You should use concrete SNRContentWidgetLayout subclasses instead.
 */

NS_SWIFT_NAME(ContentWidgetLayout)
@interface SNRContentWidgetLayout : NSObject

@property (copy, nonatomic, nonnull, readwrite) UIColor *backgroundColor;

@property (assign, nonatomic, readwrite) UIEdgeInsets insets;
@property (assign, nonatomic, readwrite) CGSize itemSize;

@property (assign, nonatomic, readonly) NSInteger numberOfItems;

@end

NS_ASSUME_NONNULL_END
