//
//  SNRError.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2017 Synerise. All rights reserved.
//

static NSString *const SNRAPIErrorDomain = @"com.synerise.sdk.api.error";
static NSString *const SNRErrorDomain = @"com.synerise.sdk.error";

static NSInteger const SNRErrorCodeInvalidEmail = 3010;
static NSInteger const SNRErrorCodeInvalidPassword = 3020;
static NSInteger const SNRErrorCodeInvalidPhoneNumber = 3030;
static NSInteger const SNRErrorCodeInvalidBirthdate = 3040;

@interface SNRError: NSError

@end
