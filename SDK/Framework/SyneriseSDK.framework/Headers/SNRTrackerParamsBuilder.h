//
//  SNRTrackerParamsBuilder.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerParamsBuilder
 *
 * Builder object for `SNRTrackerParams`.
 */

NS_SWIFT_NAME(TrackerParamsBuilder)
@interface SNRTrackerParamsBuilder : NSObject

- (void)setObject:(nonnull id)object forKey:(NSString *)key;
- (void)setString:(NSString *)string forKey:(NSString *)key;
- (void)setInt:(NSInteger)integer forKey:(NSString *)key;
- (void)setDouble:(double)doubleValue forKey:(NSString *)key;
- (void)setFloat:(float)floatValue forKey:(NSString *)key;
- (void)setBool:(BOOL)boolValue forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
