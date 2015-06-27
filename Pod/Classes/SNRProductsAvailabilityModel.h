//
//  SRProductsAvailabilityModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 15.02.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRProductsAvailabilityModel  : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger locationIdent;
@property (nonatomic, assign) NSInteger quantity;
@property (nonatomic, assign) NSInteger quantityOnWay;


- (id)initWithId:(NSInteger)locationIdent
        quantity:(NSInteger)quantity
   quantityOnWay:(NSInteger)quantityOnWay;

@end