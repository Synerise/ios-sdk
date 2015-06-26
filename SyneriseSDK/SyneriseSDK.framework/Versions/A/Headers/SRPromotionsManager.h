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

@interface SRPromotionsManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *promotions;
@property (nonatomic, strong) SNRPromotionModel *selectionPromotion;

- (void)promotionListForBusinessProfile:(NSString*)bussinessProfileId
                                  order:(NSString*)order
                                  limit:(NSString*)limit
                                 offset:(NSString*)offset
                               distance:(NSString*)distance
                              profileID:(NSString*)profileID
                           successBlock:(PromotionManagerSuccessBlock)successBlock
                             retryBlock:(PromotionManagerRetryBlock)retryBlock
                         andFailedBlock:(PromotionManagerFailedBlock)failedBlock;

- (void)favouitePromotionListWithSuccessBlock: (PromotionManagerSuccessBlock)successBlock
                            andEmptyDataBlock:(PromotionManagerEmptyDataBlock)emptyDataBlock;

@end
