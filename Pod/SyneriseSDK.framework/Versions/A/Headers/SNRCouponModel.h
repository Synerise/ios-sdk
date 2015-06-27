//
//  SRCouponModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRCouponModel : NSObject <NSCopying>


@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *expiration;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSString *couponDescription;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *imgPath;
@property (nonatomic, strong) NSString *lastingSpace;
@property (nonatomic, strong) NSString *alreadyUsed;
@property (nonatomic, strong) NSString *useDate;

- (id)initWithId:(NSString*)uuid
            name:(NSString*)name
           value:(NSString*)value
      expiration:(NSString*)expiration
           start:(NSString*)start
        discount:(NSString*)discount
     description:(NSString*)couponDescription
            type:(NSString*)type
         imgPath:(NSString*)imgPath
    lastingSpace:(NSString*)lastingSpace
     alreadyUsed:(NSString*)alreadyUsed
         useDate:(NSString*)useDate;

@end
