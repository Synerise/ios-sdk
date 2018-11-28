//
//  SNRCacheManager.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCacheManager
 */

NS_SWIFT_NAME(CacheManager)
@interface SNRCacheManager : NSObject

+ (nullable id)get:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
