//
//  SNRClientEventsApiQuery.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientEventsApiQuery
 */

NS_SWIFT_NAME(ClientEventsApiQuery)
@interface SNRClientEventsApiQuery : NSObject

@property (copy, nonatomic, nonnull, readwrite) NSArray<NSString *> *actions;

@property (copy, nonatomic, nullable, readwrite) NSDate *timeFrom;
@property (copy, nonatomic, nullable, readwrite) NSDate *timeTo;

@property (assign, nonatomic, readwrite) NSInteger limit;

@end

NS_ASSUME_NONNULL_END
