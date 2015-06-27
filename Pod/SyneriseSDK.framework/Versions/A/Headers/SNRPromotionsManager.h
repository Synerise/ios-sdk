//
//  SRPromotionsManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 12.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import "SNRAbstractManager.h"
#import "SNRPromotionModel.h"

typedef void(^PromotionManagerSuccessBlock)(void);
typedef void(^PromotionManagerEmptyDataBlock)(void);
typedef void(^PromotionManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^PromotionManagerRetryBlock)();

@interface SNRPromotionsManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *promotions;
@property (nonatomic, strong) SNRPromotionModel *selectionPromotion;

- (void)promotionListWithPeriod:(NSString*)period
               includeLocations:(BOOL)includeLocations
                          limit:(NSString*)limit
                         offset:(NSString*)offset
                   successBlock:(PromotionManagerSuccessBlock)successBlock
                     retryBlock:(PromotionManagerRetryBlock)retryBlock
                 andFailedBlock:(PromotionManagerFailedBlock)failedBlock;

- (void)favouitePromotionListWithSuccessBlock: (PromotionManagerSuccessBlock)successBlock
                            andEmptyDataBlock:(PromotionManagerEmptyDataBlock)emptyDataBlock;

@end
