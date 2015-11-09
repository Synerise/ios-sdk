//
//  SNRNewsManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 05.11.2015.
//  Copyright © 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"

#import "SNRNewsModel.h"

typedef void(^NewsManagerSuccessBlock)(void);
typedef void(^NewsManagerEmptyDataBlock)(void);
typedef void(^NewsManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^NewsManagerRetryBlock)();

@interface SNRNewsManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *news;
@property (nonatomic, strong) SNRNewsModel *selectionNews;

- (void)newsListWithPeriod:(NSString*)period
                       ids:(id)ids
                     limit:(NSString*)limit
                    offset:(NSString*)offset
                     order:(NSString*)order
                categoryId:(NSNumber*)categoryId
   includeCategoryChildren:(BOOL)includeCategoryChildren
                   successBlock:(NewsManagerSuccessBlock)successBlock
                     retryBlock:(NewsManagerRetryBlock)retryBlock
                 andFailedBlock:(NewsManagerFailedBlock)failedBlock;


- (void)favouiteNewsListWithSuccessBlock: (NewsManagerSuccessBlock)successBlock
                       andEmptyDataBlock:(NewsManagerEmptyDataBlock)emptyDataBlock;

@end
