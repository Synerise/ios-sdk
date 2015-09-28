//
//  SNRBlocksModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRBlocksModel : NSObject <NSCopying>


@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *vpos;
@property (nonatomic, strong) NSNumber *hpos;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *www;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSArray  *products;
@property (nonatomic, strong) NSNumber *vsize;
@property (nonatomic, strong) NSNumber *hsize;


- (id)initWithId:(NSString*)uuid
            name:(NSString*)name
            vpos:(NSNumber*)vpos
            hpos:(NSNumber*)hpos
           image:(NSString*)image
             www:(NSString*)www
           label:(NSString*)label
        products:(NSArray*)products
           vsize:(NSNumber*)vsize
           hsize:(NSNumber*)hsize;

@end
