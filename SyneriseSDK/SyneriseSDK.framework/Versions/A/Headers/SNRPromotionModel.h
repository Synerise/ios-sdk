//
//  SRPromotionModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 12.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRPromotionModel : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger promotionId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *availableFrom;
@property (nonatomic, strong) NSDate *availableTo;
@property (nonatomic, strong) NSString *promoDescription;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *discountValue;
@property (nonatomic, strong) NSString *discountType;
@property (nonatomic, strong) NSString *discountCode;


- (id)initWithId:(NSInteger)promotionId
            name:(NSString*)name
   availableFrom:(NSDate*)availableFrom
     availableTo:(NSDate*)availableTo
promoDescription:(NSString*)promoDescription
            path:(NSString*)path
   discountValue:(NSString*)discountValue
    discountType:(NSString*)discountType
    discountCode:(NSString*)discountCode;



@end
