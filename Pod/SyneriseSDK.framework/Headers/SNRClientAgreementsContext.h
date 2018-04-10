//
//  SNRClientAgreementsContext.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

@interface SNRClientAgreementsContext : SNRBaseContext <NSCopying>

@property (nonatomic) BOOL email;
@property (nonatomic) BOOL sms;
@property (nonatomic) BOOL push;
@property (nonatomic) BOOL bluetooth;
@property (nonatomic) BOOL rfid;
@property (nonatomic) BOOL wifi;

@end
