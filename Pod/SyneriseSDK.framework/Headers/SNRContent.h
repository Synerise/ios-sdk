//
//  SNRContent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

@class SNRDocumentsApiQuery;
@class SNRRecommendationOptions;
@class SNRRecommendationResponse;
@class SNRScreenViewResponse;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContent
 */

NS_SWIFT_NAME(Content)
@interface SNRContent : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Gets the document that is defined for the provided slug.
 *
 * @param slug Identifies a specific document.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getDocument:(NSString *)slug
            success:(void (^)(NSDictionary *document))success
            failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getDocument(slug:success:failure:));

/**
 * Gets documents that are defined for parameters provided in the query object.
 *
 * @param apiQuery `SNRDocumentsApiQuery` object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getDocumentsWithApiQuery:(SNRDocumentsApiQuery *)apiQuery
                          success:(void (^)(NSArray *documents))success
                          failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getDocuments(apiQuery:success:failure:));

/**
 * Gets recommendations that are defined for the options provided.
 *
 * @param options `SNRRecommendationOptions` object providing parameters for recommendations.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getRecommendations:(SNRRecommendationOptions *)options
            success:(void (^)(SNRRecommendationResponse *recommendationResponse))success
            failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getRecommendations(options:success:failure:));

/**
 * Gets customer's highest-priority screen view campaign.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getScreenViewWithSuccess:(void (^)(SNRScreenViewResponse *screenViewResponse))success
                         failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getScreenView(success:failure:));

@end

NS_ASSUME_NONNULL_END
