//
//  SNRPromotionImageType.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRPromotionImageType
 */

typedef NS_ENUM(NSUInteger, SNRPromotionImageType) {
    SNRPromotionImageTypeImage = 0,
    SNRPromotionImageTypeThumbnail
} NS_SWIFT_NAME(PromotionImageType);

NSString * SNR_PromotionImageTypeToString(SNRPromotionImageType type);
SNRPromotionImageType SNR_StringToPromotionImageType(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
