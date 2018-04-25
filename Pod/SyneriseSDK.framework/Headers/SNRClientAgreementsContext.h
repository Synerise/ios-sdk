//
//  SNRClientAgreementsContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

NS_SWIFT_NAME(ClientAgreementsContext)
@interface SNRClientAgreementsContext : SNRBaseContext <NSCopying>

@property (nonatomic) BOOL email;
@property (nonatomic) BOOL sms;
@property (nonatomic) BOOL push;
@property (nonatomic) BOOL bluetooth;
@property (nonatomic) BOOL rfid;
@property (nonatomic) BOOL wifi;

@end
