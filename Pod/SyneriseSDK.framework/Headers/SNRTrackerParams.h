//
//  SNRTrackerParams.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerParamsBuilder
 */

NS_SWIFT_NAME(TrackerParamsBuilder)
@interface SNRTrackerParamsBuilder : NSObject

/**
 * Adds provided NSString object to the parameters.
 *
 * @param string NSString object to be saved.
 * @param key NSString object representing key under which @c string will be stored.
 */
- (void)setString:(NSString *)string forKey:(NSString *)key;

/**
 * Adds provided NSInteger value to the parameters.
 *
 * @param integer NSInteger value to be saved.
 * @param key NSString object representing key under which @c integer will be stored.
 */
- (void)setInt:(NSInteger)integer forKey:(NSString *)key;

/**
 * Adds provided double value to the parameters.
 *
 * @param doubleValue Double value to be saved.
 * @param key NSString object representing key under which @c doubleValue will be stored.
 */
- (void)setDouble:(double)doubleValue forKey:(NSString *)key;

/**
 * Adds provided float value to the parameters.
 *
 * @param floatValue Float value to be saved.
 * @param key NSString object representing key under which @c floatValue will be stored.
 */
- (void)setFloat:(float)floatValue forKey:(NSString *)key;

/**
 * Adds provided BOOL value to the parameters.
 *
 * @param boolValue BOOL value to be saved.
 * @param key NSString object representing key under which @c boolValue will be stored.
 */
- (void)setBool:(BOOL)boolValue forKey:(NSString *)key;

/**
 * Adds a given key-value pair to the parameters.
 *
 * @param object JSON encodable object
 * @param key Key for object
 *
 * @note Object must be JSON encodable object
 *
 * @attention Raises an NSInvalidArgumentException if object is not JSON encodable.
 * @attention Raises an NSInvalidArgumentException if object is nil.
 */
- (void)setObject:(nonnull id)object forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

/**
 * @class SNRTrackerParams
 *
 * Represents custom parameters that may be added to tracked events.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TrackerParams)
@interface SNRTrackerParams : NSObject

- (instancetype)init __unavailable __attribute__((unavailable("Use [SNTRackerParams makeWithBuilder:] instead")));

+ (instancetype)new __attribute__((unavailable("Use [SNTRackerParams makeWithBuilder:] instead")));

/**
 * Initializes SNRTrackerParams object with SNRTrackerParamsBuilder.
 *
 * @param buildBlock A block object with one SNRTrackerParamsBuilder param that acts as builder.
 */
+ (instancetype)makeWithBuilder:(void (^)(SNRTrackerParamsBuilder *builder))buildBlock;

@end

NS_ASSUME_NONNULL_END
