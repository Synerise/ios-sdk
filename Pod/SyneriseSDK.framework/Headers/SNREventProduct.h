//
//  SNREventProduct.h
//  SyneriseSDK
//
//  Created on 21/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNRUnitPrice;

@interface SNREventProduct : NSObject

@property (nonatomic, copy) NSArray *categories;
@property (nonatomic) float discountPercent;
@property (nonatomic, copy) SNRUnitPrice *discountPrice;
@property (nonatomic, copy) SNRUnitPrice *finalPrice;
@property (nonatomic, copy) NSURL *imageURL;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) SNRUnitPrice *netPrice;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, copy) SNRUnitPrice *regularPrice;
@property (nonatomic, copy) NSString *sku;
@property (nonatomic) float tax;
@property (nonatomic, copy) NSURL *url;

@end
