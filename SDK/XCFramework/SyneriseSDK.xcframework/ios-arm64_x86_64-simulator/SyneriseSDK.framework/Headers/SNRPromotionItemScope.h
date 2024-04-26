//
//  SNRPromotionItemScope.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRPromotionItemScope
 */

typedef NS_ENUM(NSUInteger, SNRPromotionItemScope) {
    SNRPromotionItemScopeLineItem = 0,
    SNRPromotionItemScopeBasket

} NS_SWIFT_NAME(PromotionItemScope);

NSString * SNR_PromotionItemScopeToString(SNRPromotionItemScope scope);
SNRPromotionItemScope SNR_StringToPromotionItemScope(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
