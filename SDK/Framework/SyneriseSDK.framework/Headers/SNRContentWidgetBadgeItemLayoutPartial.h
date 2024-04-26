//
//  SNRContentWidgetBadgeItemLayoutPartial.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetBadgeItemLayoutPartial
 */

NS_SWIFT_NAME(ContentWidgetBadgeItemLayoutPartial)
@interface SNRContentWidgetBadgeItemLayoutPartial : NSObject

@property (assign, nonatomic, readwrite) CGPoint position;
@property (assign, nonatomic, readwrite) UIEdgeInsets insets;

@property (copy, nonatomic, nonnull, readwrite) UIFont *textFont;
@property (assign, nonatomic, readwrite) NSTextAlignment textAlignment;

@end

NS_ASSUME_NONNULL_END
