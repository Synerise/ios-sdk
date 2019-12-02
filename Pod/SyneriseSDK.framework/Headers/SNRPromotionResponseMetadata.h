//
//  SNRPromotionResponseMetadata.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface SNRPromotionResponseMetadata : SNRBaseModel

@property (assign, nonatomic, readonly) NSInteger totalCount;
@property (assign, nonatomic, readonly) NSInteger totalPages;
@property (assign, nonatomic, readonly) NSInteger page;
@property (assign, nonatomic, readonly) NSInteger limit;
@property (assign, nonatomic, readonly) NSInteger code;

@end

NS_ASSUME_NONNULL_END
