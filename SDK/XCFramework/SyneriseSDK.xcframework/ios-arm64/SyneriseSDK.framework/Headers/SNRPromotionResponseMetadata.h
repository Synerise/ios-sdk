//
//  SNRPromotionResponseMetadata.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionResponseMetadata
 */

NS_SWIFT_NAME(PromotionResponseMetadata)
@interface SNRPromotionResponseMetadata : SNRBaseModel

@property (assign, nonatomic, readonly) NSInteger totalCount;
@property (assign, nonatomic, readonly) NSInteger totalPages;
@property (assign, nonatomic, readonly) NSInteger page;
@property (assign, nonatomic, readonly) NSInteger limit;
@property (assign, nonatomic, readonly) NSInteger code;

@end

NS_ASSUME_NONNULL_END
