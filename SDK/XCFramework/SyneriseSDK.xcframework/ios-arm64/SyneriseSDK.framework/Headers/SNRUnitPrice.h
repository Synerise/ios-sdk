//
//  SNRUnitPrice.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRUnitPrice
 */

NS_SWIFT_NAME(UnitPrice)
@interface SNRUnitPrice : NSObject <NSCopying>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithAmount:(float)amount;
- (instancetype)initWithAmount:(float)amount locale:(NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
