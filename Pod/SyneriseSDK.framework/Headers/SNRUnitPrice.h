//
//  SNRUnitPrice.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRUnitPrice
 */

NS_SWIFT_NAME(UnitPrice)
@interface SNRUnitPrice : NSObject <NSCopying>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes a SNRUnitPrice object using provided amount and currency code specified by the current locale.
 *
 * @param amount Price value.
 */
- (instancetype)initWithAmount:(float)amount;

/**
 * Initializes a SNRUnitPrice object using provided amount and currency code specified by provided locale.
 *
 * @param amount Price value.
 * @param locale Locale to retrieve currency.
 *
 * @note This method will throw @c NSInvalidArgumentException if invalid Locale objects is provided.
 */
- (instancetype)initWithAmount:(float)amount locale:(NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
