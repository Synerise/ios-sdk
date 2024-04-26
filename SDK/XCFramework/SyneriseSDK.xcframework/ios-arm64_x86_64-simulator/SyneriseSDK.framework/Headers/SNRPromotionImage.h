//
//  SNRPromotionImage.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRPromotionImageType.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionImage
 */

NS_SWIFT_NAME(PromotionImage)
@interface SNRPromotionImage : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *url;
@property (assign, nonatomic, readonly) SNRPromotionImageType type;

@end

NS_ASSUME_NONNULL_END
