//
//  SNRClientSessionEndReason.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

/**
 * @enum SNRClientSessionEndReason
 */

typedef NS_ENUM(NSUInteger, SNRClientSessionEndReason) {
    SNRClientSessionEndReasonUserSignOut,
    SNRClientSessionEndReasonSystemSignOut,
    SNRClientSessionEndReasonSessionExpiration,
    SNRClientSessionEndReasonSessionDestroyed,
    SNRClientSessionEndReasonSecurityException,
} NS_SWIFT_NAME(ClientSessionEndReason);

