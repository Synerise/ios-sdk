//
//  SNRClientAgreements.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientAgreements
 */

NS_SWIFT_NAME(ClientAgreements)
@interface SNRClientAgreements : SNRBaseModel <NSSecureCoding, NSCopying>

@property (assign, nonatomic, readwrite) BOOL email;
@property (assign, nonatomic, readwrite) BOOL sms;
@property (assign, nonatomic, readwrite) BOOL push;
@property (assign, nonatomic, readwrite) BOOL bluetooth;
@property (assign, nonatomic, readwrite) BOOL rfid;
@property (assign, nonatomic, readwrite) BOOL wifi;

@end

NS_ASSUME_NONNULL_END
