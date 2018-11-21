//
//  SNRCacheService.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCacheService
 */

NS_SWIFT_NAME(CacheService)
@interface SNRCacheService : NSObject

+ (nullable id)loadObject:(Class)aClass;
+ (void)saveObject:(id)object;

@end

NS_ASSUME_NONNULL_END
