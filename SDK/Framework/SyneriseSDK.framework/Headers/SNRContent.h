//
//  SNRContent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

@class SNRDocument;
@class SNRDocumentsApiQuery;
@class SNRRecommendationOptions;
@class SNRRecommendationResponse;
@class SNRScreenViewResponse;
@class SNRScreenView;

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
 * 
 * @deprecated Deprecated in version 4.13.0
 */
+ (void)getDocument:(NSString *)slug
            success:(void (^)(NSDictionary *document))success
            failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getDocument(slug:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Content.generateDocument(slug:success:failure:)` instead.");

/**
 * Generates the document that is defined for the provided slug.
 *
 * @param slug Identifies a specific document.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)generateDocument:(NSString *)slug
                 success:(void (^)(SNRDocument *document))success
                 failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(generateDocument(slug:success:failure:));


/**
 * Gets documents that are defined for parameters provided in the query object.
 *
 * @param apiQuery `SNRDocumentsApiQuery` object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 4.13.0
 */
+ (void)getDocumentsWithApiQuery:(SNRDocumentsApiQuery *)apiQuery
                         success:(void (^)(NSArray *documents))success
                         failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getDocuments(apiQuery:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("This method is deprecated.");

/**
 * Gets recommendations that are defined for the options provided.
 *
 * @param options `SNRRecommendationOptions` object providing parameters for recommendations.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 4.13.0
 */
+ (void)getRecommendations:(SNRRecommendationOptions *)options
                   success:(void (^)(SNRRecommendationResponse *recommendationResponse))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getRecommendations(options:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Content.getRecommendationsV2(options:success:failure:)` instead.");

/**
 * Gets recommendations that are defined for the options provided.
 *
 * @param options `SNRRecommendationOptions` object providing parameters for recommendations.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getRecommendationsV2:(SNRRecommendationOptions *)options
                     success:(void (^)(SNRRecommendationResponse *recommendationResponse))success
                     failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getRecommendationsV2(options:success:failure:));

/**
 * Gets customer's highest-priority screen view campaign.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 4.13.0
 */
+ (void)getScreenViewWithSuccess:(void (^)(SNRScreenViewResponse *screenViewResponse))success
                         failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getScreenView(success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Content.generateScreenView(slug:success:failure:)` instead.");

/**
 * Generates customer's highest-priority screen view campaign that is defined for the provided slug.
 *
 * @param feedSlug Identifies a specific screen view.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)generateScreenView:(NSString *)feedSlug
                   success:(void (^)(SNRScreenView *screenView))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(generateScreenView(feedSlug:success:failure:));

@end

NS_ASSUME_NONNULL_END
