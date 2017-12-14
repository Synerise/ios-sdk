//
//  SNRUnitPrice.h
//  SyneriseSDK
//
//  Created on 21/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

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
- (nonnull instancetype)initWithAmount:(float)amount locale:(NSLocale * _Nonnull)locale;

@end
