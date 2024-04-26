//
//  SNRRecommendation.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRRecommendation
 */

NS_SWIFT_NAME(Recommendation)
@interface SNRRecommendation : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *itemID;
@property (copy, nonatomic, nonnull, readonly) NSDictionary *attributes;

- (BOOL)isAttributeSetForKey:(NSString *)key;
- (nullable id)getAttributeSetForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
