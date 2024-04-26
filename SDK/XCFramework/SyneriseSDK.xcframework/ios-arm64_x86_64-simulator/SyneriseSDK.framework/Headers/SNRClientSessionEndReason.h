//
//  SNRClientSessionEndReason.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
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
    SNRClientSessionEndReasonClientRejected,
    SNRClientSessionEndReasonUserAccountDeleted,
} NS_SWIFT_NAME(ClientSessionEndReason);

