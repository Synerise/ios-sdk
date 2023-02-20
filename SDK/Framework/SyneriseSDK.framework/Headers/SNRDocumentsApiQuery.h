//
//  SNRDocumentsApiQuery.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRDocumentsApiQueryType
 */

typedef NS_ENUM(NSInteger, SNRDocumentsApiQueryType) {
    SNRDocumentsApiQueryTypeBySchema
} NS_SWIFT_NAME(DocumentsApiQueryType);


/**
 * @class SNRDocumentsApiQuery
 */

NS_SWIFT_NAME(DocumentsApiQuery)
@interface SNRDocumentsApiQuery : NSObject

@property (assign, nonatomic, readonly) SNRDocumentsApiQueryType type;
@property (copy, nonatomic, nonnull, readonly) NSString *typeValue;

@property (copy, nonatomic, nullable, readwrite) NSString *version;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithType:(SNRDocumentsApiQueryType)type typeValue:(NSString *)typeValue NS_SWIFT_NAME(init(type:typeValue:));

@end

NS_ASSUME_NONNULL_END
