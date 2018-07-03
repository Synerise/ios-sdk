//
//  SNRClientAgreementsContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientAgreementsContext)
@interface SNRClientAgreementsContext : SNRBaseContext <NSCopying>

@property (assign, nonatomic, readwrite) BOOL email;
@property (assign, nonatomic, readwrite) BOOL sms;
@property (assign, nonatomic, readwrite) BOOL push;
@property (assign, nonatomic, readwrite) BOOL bluetooth;
@property (assign, nonatomic, readwrite) BOOL rfid;
@property (assign, nonatomic, readwrite) BOOL wifi;

@end

NS_ASSUME_NONNULL_END
