//
//  SNRUnitPrice.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_SWIFT_NAME(UnitPrice)
@interface SNRUnitPrice : NSObject <NSCopying>

- (nonnull instancetype)init __unavailable;

/**
 Initializes a SNRUnitPrice object using provided amount and currency code specified by current locale.

 @param amount Price value.
 @return The initialized SNRUnitPrice object.
 */
- (nonnull instancetype)initWithAmount:(float)amount;

/**
 Initializes a SNRUnitPrice object using provided amount and currency code specified by provided locale.

 @param amount Price value.
 @param locale Locale to retrieve currency.
 @return The initialized SNRUnitPrice object.

 @note This method will throw @c NSInvalidArgumentException if invalid Locale objects is provided.
 */
- (nonnull instancetype)initWithAmount:(float)amount locale:(nonnull NSLocale *)locale;

@end
