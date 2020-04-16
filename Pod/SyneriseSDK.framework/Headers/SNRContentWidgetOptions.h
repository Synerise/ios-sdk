//
//  SNRContentWidgetOptions.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const SNRContentWidgetOptionsAttributeKeyProductID;

/**
 * @class SNRContentWidgetOptions
 */

NS_SWIFT_NAME(ContentWidgetOptions)
@interface SNRContentWidgetOptions : NSObject

@property (copy, nonatomic, nullable, readwrite) NSString *slug;
@property (strong, nonatomic, nonnull, readonly) NSMutableDictionary *attributes;

@end

NS_ASSUME_NONNULL_END
