//
//  SyneriseSDK.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#import <SyneriseSDK/SNRSynerise.h>

// Settings
#import <SyneriseSDK/SNRSettings.h>
#import <SyneriseSDK/SNRGeneralSettings.h>
#import <SyneriseSDK/SNRNotificationsSettings.h>
#import <SyneriseSDK/SNRTrackerSettings.h>
#import <SyneriseSDK/SNRTrackerAutoTrackingSettings.h>
#import <SyneriseSDK/SNRTrackerDeclarativeTrackingSettings.h>
#import <SyneriseSDK/SNRInjectorSettings.h>

// Modules
#import <SyneriseSDK/SNRTracker.h>
#import <SyneriseSDK/SNRClient.h>
#import <SyneriseSDK/SNRClientEventsApiQuery.h>
#import <SyneriseSDK/SNRContent.h>
#import <SyneriseSDK/SNRInjector.h>
#import <SyneriseSDK/SNRPromotions.h>
#import <SyneriseSDK/SNRChat.h>

// API Queries
#import <SyneriseSDK/SNRApiQuerySortingOrder.h>
#import <SyneriseSDK/SNRPromotionsApiQuery.h>
#import <SyneriseSDK/SNRDocumentsApiQuery.h>

// Types
#import <SyneriseSDK/SNRClientSessionEndReason.h>

// Exceptions
#import <SyneriseSDK/SNRExceptionHandler.h>
#import <SyneriseSDK/SNRException.h>
#import <SyneriseSDK/SNRInvalidArgumentException.h>

// Errors
#import <SyneriseSDK/SNRErrorsList.h>
#import <SyneriseSDK/SNRError.h>
#import <SyneriseSDK/SNRApiError.h>
#import <SyneriseSDK/SNRInvalidArgumentError.h>

// Managers
#import <SyneriseSDK/SNRCacheManager.h>

// Events
#import <SyneriseSDK/SNREvent.h>
#import <SyneriseSDK/SNRCustomEvent.h>
#import <SyneriseSDK/SNRLoggedInEvent.h>
#import <SyneriseSDK/SNRLoggedOutEvent.h>
#import <SyneriseSDK/SNRRegisteredEvent.h>
#import <SyneriseSDK/SNRCartEvent.h>
#import <SyneriseSDK/SNRAddedProductToCartEvent.h>
#import <SyneriseSDK/SNRAddedProductToFavoritesEvent.h>
#import <SyneriseSDK/SNRRemovedProductFromCartEvent.h>
#import <SyneriseSDK/SNRProductViewEvent.h>
#import <SyneriseSDK/SNRRecommendationSeenEvent.h>
#import <SyneriseSDK/SNRRecommendationClickEvent.h>
#import <SyneriseSDK/SNRPushClickedEvent.h>
#import <SyneriseSDK/SNRPushViewedEvent.h>
#import <SyneriseSDK/SNRCancelledPushEvent.h>
#import <SyneriseSDK/SNRAppearedInLocationEvent.h>
#import <SyneriseSDK/SNRHitTimerEvent.h>
#import <SyneriseSDK/SNRSearchedEvent.h>
#import <SyneriseSDK/SNRSharedEvent.h>
#import <SyneriseSDK/SNRVisitedScreenEvent.h>
#import <SyneriseSDK/SNRCrashEvent.h>
#import <SyneriseSDK/SNRTrackerParams.h>

// Events Models
#import <SyneriseSDK/SNRUnitPrice.h>
#import <SyneriseSDK/SNREventProduct.h>

// API Models
#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRClientAgreements.h>
#import <SyneriseSDK/SNRClientSex.h>
#import <SyneriseSDK/SNRClientRegisterAccountContext.h>
#import <SyneriseSDK/SNRClientFacebookAuthenticationContext.h>
#import <SyneriseSDK/SNRClientOAuthContext.h>
#import <SyneriseSDK/SNRClientPasswordResetRequestContext.h>
#import <SyneriseSDK/SNRClientPasswordResetConfirmationContext.h>
#import <SyneriseSDK/SNRClientUpdateAccountContext.h>
#import <SyneriseSDK/SNRClientAccountInformation.h>
#import <SyneriseSDK/SNRPromotionStatus.h>
#import <SyneriseSDK/SNRPromotionType.h>
#import <SyneriseSDK/SNRPromotionDiscountType.h>
#import <SyneriseSDK/SNRPromotionResponse.h>
#import <SyneriseSDK/SNRPromotion.h>
#import <SyneriseSDK/SNRVoucherStatus.h>
#import <SyneriseSDK/SNRAssignVoucherResponse.h>
#import <SyneriseSDK/SNRAssignVoucherData.h>
#import <SyneriseSDK/SNRVoucherCodesResponse.h>
#import <SyneriseSDK/SNRVoucherCodesData.h>
#import <SyneriseSDK/SNRRecommendationOptions.h>
#import <SyneriseSDK/SNRRecommendationResponse.h>
#import <SyneriseSDK/SNRRecommendation.h>
#import <SyneriseSDK/SNRTokenOrigin.h>
#import <SyneriseSDK/SNRToken.h>
#import <SyneriseSDK/SNRClientEventData.h>

// Content Widget
#import <SyneriseSDK/SNRContentWidgetAppearance.h>
#import <SyneriseSDK/SNRContentWidgetLayout.h>
#import <SyneriseSDK/SNRContentWidgetHorizontalSliderLayout.h>
#import <SyneriseSDK/SNRContentWidgetGridLayout.h>
#import <SyneriseSDK/SNRContentWidgetItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetBasicProductItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetBaseCustomAction.h>
#import <SyneriseSDK/SNRContentWidgetImageButtonCustomAction.h>
#import <SyneriseSDK/SNRContentWidgetOptions.h>
#import <SyneriseSDK/SNRContentWidget.h>

// Content Extensions
#import <SyneriseSDK/SNRSingleMediaContentExtensionViewController.h>
#import <SyneriseSDK/SNRCarouselContentExtensionViewController.h>
