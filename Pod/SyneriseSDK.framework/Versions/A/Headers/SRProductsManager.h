//
//  SRProductsManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 14.02.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"
#import "SNRProductModel.h"

typedef void(^ProductsManagerSuccessBlock)(void);
typedef void(^ProductsManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^ProductsManagerRetryBlock)();

@interface SRProductsManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *productSizes;
@property (nonatomic, strong) NSArray *productAvailability;
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) SNRProductModel *selectedProduct;


- (void)combinationLocationAvailIdent:(NSString*)itemIndex
                         successBlock:(ProductsManagerSuccessBlock)successBlock
                           retryBlock:(ProductsManagerRetryBlock)retryBlock
                       andFailedBlock:(ProductsManagerFailedBlock)failedBlock;

- (void)sizesAvail:(NSString*)itemIndex
      successBlock:(ProductsManagerSuccessBlock)successBlock
        retryBlock:(ProductsManagerRetryBlock)retryBlock
    andFailedBlock:(ProductsManagerFailedBlock)failedBlock;

- (void)productListByCategory:(NSInteger)categoryId
                        limit:(NSInteger)limit
                 successBlock:(ProductsManagerSuccessBlock)successBlock
                   retryBlock:(ProductsManagerRetryBlock)retryBlock
               andFailedBlock:(ProductsManagerFailedBlock)failedBlock;

@end