//
//  SNRApi.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 29.12.2014.
//  Copyright (c) 2014 HG Intelligence. All rights reserved.
//

#import "SNRApiCategoriesProtocol.h"
#import "SNRApiClientProtocol.h"
#import "SNRApiCouponsProtocol.h"
#import "SNRApiLocationsProtocol.h"
#import "SNRApiProductsProtocol.h"
#import "SNRApiPromotionsProtocol.h"
#import "SNRApiTrackerProtocol.h"
#import "SNRApiProfileLocationsProtocol.h"
#import "SNRApiBeaconProtocol.h"
#import "SNRApiScreenBlockProtocol.h"


@interface SNRApi: NSObject <SNRApiBeaconProtocol,
                            SNRApiPromotionsProtocol,
                            SNRApiLocationsProtocol,
                            SNRApiTrackerProtocol,
                            SNRApiProductsProtocol,
                            SNRApiCouponsProtocol,
                            SNRApiCategoriesProtocol,
                            SNRApiClientProtocol,
                            SNRApiProfileLocationsProtocol,
                            SNRApiScreenBlockProtocol>

@end
