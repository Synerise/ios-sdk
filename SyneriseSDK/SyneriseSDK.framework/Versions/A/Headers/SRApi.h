//
//  SRApi.h
//  SyneriseBeacon
//
//  Created by Milosz Balus on 29.12.2014.
//  Copyright (c) 2014 Humanoit Group. All rights reserved.
//

#import "SRApiCategoriesProtocol.h"
#import "SRApiClientProtocol.h"
#import "SRApiCuponsProtocol.h"
#import "SRApiLocationsProtocol.h"
#import "SRApiProductsProtocol.h"
#import "SRApiPromotionsProtocol.h"
#import "SRApiTrackerProtocol.h"


@interface SRApi: NSObject <SRApiPromotionsProtocol,
                            SRApiLocationsProtocol,
                            SRApiTrackerProtocol,
                            SRApiProductsProtocol,
                            SRApiCuponsProtocol,
                            SRApiCategoriesProtocol,
                            SRApiClientProtocol>

@end
