// 
//  SNRErrorsList.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#ifndef SNRErrorsList_h
#define SNRErrorsList_h

static NSString * const SNRAPIErrorDomain = @"com.synerise.sdk.api.error";
static NSString * const SNRErrorDomain = @"com.synerise.sdk.error";

static NSInteger const SNRErrorCodeUnknownError = -101;
static NSInteger const SNRErrorCodeUnknownApiError = -102;

static NSInteger const SNRErrorCodeInvalidEmail = 3010;
static NSInteger const SNRErrorCodeInvalidPassword = 3020;
static NSInteger const SNRErrorCodeInvalidPhoneNumber = 3030;
static NSInteger const SNRErrorCodeInvalidBirthdate = 3040;
static NSInteger const SNRErrorCodeInvalidArgument = 3050;
static NSInteger const SNRErrorCodePasswordIsNotEqualToSavedPassword = 3060;
static NSInteger const SNRErrorCodePoolUuidIsEmpty = 3070;

static NSInteger const SNRErrorCodeImageNotDownloaded = 3110;

#endif
