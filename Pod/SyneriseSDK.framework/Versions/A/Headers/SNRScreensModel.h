//
//  SRCouponModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRScreensModel : NSObject <NSCopying>


@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *vpos;
@property (nonatomic, strong) NSNumber *hpos;
@property (nonatomic, strong) NSString *image;


- (id)initWithId:(NSString*)uuid
            name:(NSString*)name
            vpos:(NSNumber*)vpos
            hpos:(NSNumber*)hpos
           image:(NSString*)image;

@end
