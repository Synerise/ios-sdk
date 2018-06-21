//
//  SNREventProduct.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNRUnitPrice;

NS_SWIFT_NAME(EventProduct)
@interface SNREventProduct : NSObject

@property (copy, nonatomic) NSArray *categories;
@property (nonatomic) float discountPercent;
@property (copy, nonatomic) SNRUnitPrice *discountPrice;
@property (copy, nonatomic) SNRUnitPrice *finalPrice;
@property (copy, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) SNRUnitPrice *netPrice;
@property (nonatomic) NSInteger quantity;
@property (copy, nonatomic) SNRUnitPrice *regularPrice;
@property (copy, nonatomic) NSString *sku;
@property (nonatomic) float tax;
@property (copy, nonatomic) NSURL *url;

@end
