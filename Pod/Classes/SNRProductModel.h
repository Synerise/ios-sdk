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
@property (nonatomic, strong) NSString *itemIndex;
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, strong) NSString *line;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *productDesc;
@property (nonatomic, strong) NSDecimalNumber *regularPriceWithTax;
@property (nonatomic, strong) NSDecimalNumber *regularPriceWithoutTax;
@property (nonatomic, strong) NSDecimalNumber *finalPriceWithTax;
@property (nonatomic, strong) NSDecimalNumber *finalPriceWithoutTax;
@property (nonatomic, assign) BOOL isSaleable;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, retain) NSArray *propertiesList;
@property (nonatomic, retain) NSArray *imagesList;


- (id)initWithId:(NSInteger)productId
          typeId:(NSString*)typeId
       itemIndex:(NSString*)itemIndex
      categoryId:(NSInteger)categoryId
            line:(NSString*)line
            type:(NSString*)type
           color:(NSString*)color
            size:(NSString*)size
            name:(NSString*)name
             url:(NSString*)url
            unit:(NSString*)unit
     productDesc:(NSString*)productDesc
regularPriceWithTax:(NSDecimalNumber*)regularPriceWithTax
regularPriceWithoutTax:(NSDecimalNumber*)regularPriceWithoutTax
finalPriceWithTax:(NSDecimalNumber*)finalPriceWithTax
finalPriceWithoutTax:(NSDecimalNumber*)finalPriceWithoutTax
      isSaleable:(BOOL) isSaleable
        imageUrl:(NSString*)imageUrl
  propertiesList:(NSArray*)properties
      imagesList:(NSArray*)imagesList;

@end
