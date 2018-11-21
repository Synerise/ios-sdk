//
//  SNREventProduct.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNRUnitPrice;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNREventProduct
 */

NS_SWIFT_NAME(EventProduct)
@interface SNREventProduct : NSObject

@property (copy, nonatomic, nullable, readwrite) NSArray *categories;
@property (assign, nonatomic, readwrite) float discountPercent;
@property (copy, nonatomic, nullable, readwrite) SNRUnitPrice *discountPrice;
@property (copy, nonatomic, nullable, readwrite) SNRUnitPrice *finalPrice;
@property (copy, nonatomic, nullable, readwrite) NSURL *imageURL;
@property (copy, nonatomic, nullable, readwrite) NSString *name;
@property (copy, nonatomic, nullable, readwrite) SNRUnitPrice *netPrice;
@property (assign, nonatomic, readwrite) NSInteger quantity;
@property (copy, nonatomic, nullable, readwrite) SNRUnitPrice *regularPrice;
@property (copy, nonatomic, nullable, readwrite) NSString *sku;
@property (assign, nonatomic, readwrite) float tax;
@property (copy, nonatomic, nullable, readwrite) NSURL *url;

@end

NS_ASSUME_NONNULL_END
