//
//  SNRContent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

@class SNRRecommendationOptions;
@class SNRRecommendationResponse;
@class SNRDocumentsApiQuery;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContent
 */

NS_SWIFT_NAME(Content)
@interface SNRContent : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * This method enables/disables console logs from Content SDK.
 * It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Gets document that is defined for slug provided.
 *
 * @param slug Identifies a specific document.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getDocument:(NSString *)slug
            success:(nullable void (^)(NSDictionary *document))success
            failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getDocument(slug:success:failure:));

/**
 * Gets documents  that are defined for parameters provided in query object.
 *
 * @param apiQuery SNRDocumentsApiQuery object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getDocumentsWithApiQuery:(SNRDocumentsApiQuery *)apiQuery
                          success:(nullable void (^)(NSArray *documents))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getDocuments(apiQuery:success:failure:));

/**
 * Gets recommendations that are defined for options provided.
 *
 * @param options Options for recommendations.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getRecommendations:(SNRRecommendationOptions *)options
            success:(nullable void (^)(SNRRecommendationResponse *recommendationResponse))success
            failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getRecommendations(options:success:failure:));

@end

NS_ASSUME_NONNULL_END
