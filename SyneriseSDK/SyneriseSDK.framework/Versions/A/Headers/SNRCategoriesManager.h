//
//  SRCategoriesManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"

typedef void(^CategoriesManagerSuccessBlock)(void);
typedef void(^CategoriesManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^CategoriesManagerRetryBlock)();


@interface SNRCategoriesManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSMutableArray *currentSubCategories;

- (void)categoryListWithSuccessBlock:(CategoriesManagerSuccessBlock)successBlock
                          retryBlock:(CategoriesManagerRetryBlock)retryBlock
                      andFailedBlock:(CategoriesManagerFailedBlock)failedBlock;


- (NSArray*)categoryByParentId:(NSInteger)parentId;

@end
