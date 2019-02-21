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
static NSInteger const SNRErrorCodeNetworkApiError = -105;
static NSInteger const SNRErrorCodeInvalidRequestApiError = -103;
static NSInteger const SNRErrorCodeInvalidRequestSessionApiError = -104;
static NSInteger const SNRErrorCodeInvalidResponseApiError = -106;

static NSInteger const SNRErrorCodeInvalidArgument = 3050;

static NSInteger const SNRErrorCodeImageNotDownloaded = 3110;

static NSInteger const SNRErrorCodeClientSessionUnauthorized = 3200;
static NSInteger const SNRErrorCodeClientSessionExpired = 3210;

static NSInteger const SNRErrorCodeJWTValidationFailed = 3300;

#endif
