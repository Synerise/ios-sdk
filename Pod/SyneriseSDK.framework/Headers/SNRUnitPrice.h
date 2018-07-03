//
//  SNRUnitPrice.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(UnitPrice)
@interface SNRUnitPrice : NSObject <NSCopying>

- (instancetype)init __unavailable;

/**
 Initializes a SNRUnitPrice object using provided amount and currency code specified by the current locale.
 
 @param amount Price value.
 @return The initialized SNRUnitPrice object.
 */
- (instancetype)initWithAmount:(float)amount;

/**
 Initializes a SNRUnitPrice object using provided amount and currency code specified by provided locale.
 
 @param amount Price value.
 @param locale Locale to retrieve currency.
 @return The initialized SNRUnitPrice object.
 
 @note This method will throw @c NSInvalidArgumentException if invalid Locale objects is provided.
 */
- (instancetype)initWithAmount:(float)amount locale:(NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
