//
//  SNRApiQuerySortOrder.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

typedef NSString *SNRApiQuerySortingOrderString;

FOUNDATION_EXPORT SNRApiQuerySortingOrderString const SNR_API_QUERY_SORTING_ASC;
FOUNDATION_EXPORT SNRApiQuerySortingOrderString const SNR_API_QUERY_SORTING_DESC;

/**
 * @enum SNRApiQuerySortingOrder
 */

typedef NS_ENUM(NSUInteger, SNRApiQuerySortingOrder) {
    SNRApiQuerySortingOrderAscending,
    SNRApiQuerySortingOrderDescending
};

NSString * SNR_ApiQuerySortingOrderToString(SNRApiQuerySortingOrder type);
SNRApiQuerySortingOrder SNR_StringToApiQuerySortingOrder(NSString *string);
