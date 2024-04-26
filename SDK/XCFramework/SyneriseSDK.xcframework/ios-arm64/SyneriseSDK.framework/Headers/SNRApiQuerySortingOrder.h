//
//  SNRApiQuerySortingOrder.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

typedef NSString * SNRApiQuerySortingOrderString;

FOUNDATION_EXPORT SNRApiQuerySortingOrderString const SNR_API_QUERY_SORTING_ASC;
FOUNDATION_EXPORT SNRApiQuerySortingOrderString const SNR_API_QUERY_SORTING_DESC;

/**
 * @enum SNRApiQuerySortingOrder
 */

typedef NS_ENUM(NSUInteger, SNRApiQuerySortingOrder) {
    SNRApiQuerySortingOrderAscending,
    SNRApiQuerySortingOrderDescending
} NS_SWIFT_NAME(ApiQuerySortingOrder);

NSString * SNR_ApiQuerySortingOrderToString(SNRApiQuerySortingOrder type);
SNRApiQuerySortingOrder SNR_StringToApiQuerySortingOrder(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
