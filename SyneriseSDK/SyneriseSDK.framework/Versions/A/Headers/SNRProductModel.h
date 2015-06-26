//
//  SRProductModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 24.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRProductModel : NSObject

@property (nonatomic, assign) NSInteger productId;
@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSString *sku;
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, strong) NSString *line;
@property (nonatomic, strong) NSString *heelHeightCm;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *skin;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDecimalNumber *regularPriceWithTax;
@property (nonatomic, strong) NSDecimalNumber *regularPriceWithoutTax;
@property (nonatomic, strong) NSDecimalNumber *finalPriceWithTax;
@property (nonatomic, strong) NSDecimalNumber *finalPriceWithoutTax;
@property (nonatomic, assign) BOOL isSaleable;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, retain) NSArray * imagesList;


- (id)initWithId:(NSInteger)productId
          typeId:(NSString*)typeId
             sku:(NSString*)sku
      categoryId:(NSInteger) categoryId
            line:(NSString*)line
    heelHeightCm:(NSString*)heelHeightCm
            type:(NSString*)type
           color:(NSString*)color
            skin:(NSString*)skin
            size:(NSString*)size
            name:(NSString*)name
regularPriceWithTax:(NSDecimalNumber*)regularPriceWithTax
regularPriceWithoutTax:(NSDecimalNumber*)regularPriceWithoutTax
finalPriceWithTax:(NSDecimalNumber*)finalPriceWithTax
finalPriceWithoutTax:(NSDecimalNumber*)finalPriceWithoutTax
      isSaleable:(BOOL) isSaleable
        imageUrl:(NSString*)imageUrl
      imagesList:(NSArray*)imagesList;

@end
