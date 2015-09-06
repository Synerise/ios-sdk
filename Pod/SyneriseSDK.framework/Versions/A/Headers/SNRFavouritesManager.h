//
//  SRFavouritesManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 20.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import "SNRAbstractManager.h"
#import "SNRPromotionModel.h"

typedef void(^FavouritesManagerAddBlock)(void);
typedef void(^FavouritesManagerDeleteBlock)(void);

typedef void(^FavouritesManagerSuccessBlock)(void);
typedef void(^FavouritesManagerFailedBlock)(NSError *error, UIAlertView *alertView);

#define SR_FAVOURTE_TYPE_PROMOTION @"1"

@interface SNRFavouritesManager : SNRAbstractManager


- (void)changeStateForFavouriteID:(NSNumber*) objectId
                           object:(id)object
                         addBlock: (FavouritesManagerAddBlock) addBlock
                   andDeleteBlock:(FavouritesManagerDeleteBlock) deleteBlock;


- (void)isFavourite:(NSNumber*) objectId
           addBlock: (FavouritesManagerAddBlock) addBlock
     andDeleteBlock:(FavouritesManagerDeleteBlock) deleteBlock;

@end
