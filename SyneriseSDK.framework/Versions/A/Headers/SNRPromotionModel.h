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
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *end;
@property (nonatomic, strong) NSString *promoDescription;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *discountCode;
@property (nonatomic, strong) NSString *nearestDistance;


- (id)initWithId:(NSInteger)promotionId
            name:(NSString*)name
           start:(NSString*)start
             end:(NSString*)end
promoDescription:(NSString*)promoDescription
            path:(NSString*)path
           value:(NSString*)value
            unit:(NSString*)unit
    discountCode:(NSString*)discountCode
 nearestDistance:(NSString*)nearestDistance;


@end
