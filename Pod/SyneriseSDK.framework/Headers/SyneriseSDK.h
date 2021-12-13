//
//  SyneriseSDK.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CommonCrypto/CommonCrypto.h>

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
#import <SyneriseSDK/SNRContent.h>
#import <SyneriseSDK/SNRInjector.h>
#import <SyneriseSDK/SNRPromotions.h>

// API Queries
#import <SyneriseSDK/SNRApiQuerySortingOrder.h>
#import <SyneriseSDK/SNRClientEventsApiQuery.h>
#import <SyneriseSDK/SNRPromotionsApiQuery.h>
#import <SyneriseSDK/SNRDocumentsApiQuery.h>

// Exceptions
#import <SyneriseSDK/SNRExceptionHandler.h>
#import <SyneriseSDK/SNRException.h>
#import <SyneriseSDK/SNRInvalidArgumentException.h>
#import <SyneriseSDK/SNRInternalInconsistencyException.h>

// Errors
#import <SyneriseSDK/SNRErrorCode.h>
#import <SyneriseSDK/SNRErrorUserInfoKey.h>
#import <SyneriseSDK/SNRError.h>
#import <SyneriseSDK/SNRApiError.h>
#import <SyneriseSDK/SNRInvalidArgumentError.h>
#import <SyneriseSDK/SNRInternalInconsistencyError.h>

// Other Types
#import <SyneriseSDK/SNRHostApplicationType.h>
#import <SyneriseSDK/SNRPublicKeyPinningAlgorithm.h>
#import <SyneriseSDK/SNRClientSessionEndReason.h>
#import <SyneriseSDK/SNRClientIdentityProvider.h>

// Managers
#import <SyneriseSDK/SNRCacheManager.h>

// Events
#import <SyneriseSDK/SNRTrackerParams.h>
#import <SyneriseSDK/SNRTrackerParamsBuilder.h>

#import <SyneriseSDK/SNREvent.h>
#import <SyneriseSDK/SNRCustomEvent.h>
#import <SyneriseSDK/SNRLoggedInEvent.h>
#import <SyneriseSDK/SNRLoggedOutEvent.h>
#import <SyneriseSDK/SNRRegisteredEvent.h>
#import <SyneriseSDK/SNRCartEvent.h>
#import <SyneriseSDK/SNRProductAddedToCartEvent.h>
#import <SyneriseSDK/SNRProductRemovedFromCartEvent.h>
#import <SyneriseSDK/SNRProductAddedToFavoritesEvent.h>
#import <SyneriseSDK/SNRProductViewedEvent.h>
#import <SyneriseSDK/SNRRecommendationSeenEvent.h>
#import <SyneriseSDK/SNRRecommendationClickEvent.h>
#import <SyneriseSDK/SNRPushClickedEvent.h>
#import <SyneriseSDK/SNRPushViewedEvent.h>
#import <SyneriseSDK/SNRPushCancelledEvent.h>
#import <SyneriseSDK/SNRAppearedInLocationEvent.h>
#import <SyneriseSDK/SNRHitTimerEvent.h>
#import <SyneriseSDK/SNRSearchedEvent.h>
#import <SyneriseSDK/SNRSharedEvent.h>
#import <SyneriseSDK/SNRVisitedScreenEvent.h>
#import <SyneriseSDK/SNRCrashEvent.h>
#import <SyneriseSDK/SNRUnitPrice.h>

// API Models
#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRClientAgreements.h>
#import <SyneriseSDK/SNRClientSex.h>
#import <SyneriseSDK/SNRClientRegisterAccountContext.h>
#import <SyneriseSDK/SNRClientAuthenticationContext.h>
#import <SyneriseSDK/SNRClientConditionalAuthenticationContext.h>
#import <SyneriseSDK/SNRClientOAuthAuthenticationContext.h>
#import <SyneriseSDK/SNRClientFacebookAuthenticationContext.h>
#import <SyneriseSDK/SNRClientAppleSignInAuthenticationContext.h>
#import <SyneriseSDK/SNRClientConditionalAuthStatus.h>
#import <SyneriseSDK/SNRClientConditionalAuthResult.h>
#import <SyneriseSDK/SNRClientPasswordResetRequestContext.h>
#import <SyneriseSDK/SNRClientPasswordResetConfirmationContext.h>
#import <SyneriseSDK/SNRClientUpdateAccountContext.h>
#import <SyneriseSDK/SNRClientAccountInformation.h>
#import <SyneriseSDK/SNRClientEventData.h>
#import <SyneriseSDK/SNRTokenOrigin.h>
#import <SyneriseSDK/SNRToken.h>
#import <SyneriseSDK/SNRPromotionIdentifier.h>
#import <SyneriseSDK/SNRPromotionDiscountModeDetails.h>
#import <SyneriseSDK/SNRPromotionDiscountStep.h>
#import <SyneriseSDK/SNRPromotionDiscountUsageTrigger.h>
#import <SyneriseSDK/SNRPromotionStatus.h>
#import <SyneriseSDK/SNRPromotionType.h>
#import <SyneriseSDK/SNRPromotionDiscountType.h>
#import <SyneriseSDK/SNRPromotionDiscountMode.h>
#import <SyneriseSDK/SNRPromotionDetails.h>
#import <SyneriseSDK/SNRPromotionDiscountTypeDetails.h>
#import <SyneriseSDK/SNRPromotionItemScope.h>
#import <SyneriseSDK/SNRPromotionImage.h>
#import <SyneriseSDK/SNRPromotionImageType.h>
#import <SyneriseSDK/SNRPromotion.h>
#import <SyneriseSDK/SNRPromotionResponse.h>
#import <SyneriseSDK/SNRPromotionResponseMetadata.h>
#import <SyneriseSDK/SNRVoucherCodeStatus.h>
#import <SyneriseSDK/SNRAssignVoucherResponse.h>
#import <SyneriseSDK/SNRAssignVoucherData.h>
#import <SyneriseSDK/SNRVoucherCodesResponse.h>
#import <SyneriseSDK/SNRVoucherCodesData.h>
#import <SyneriseSDK/SNRRecommendationOptions.h>
#import <SyneriseSDK/SNRRecommendationResponse.h>
#import <SyneriseSDK/SNRRecommendation.h>
#import <SyneriseSDK/SNRScreenViewResponse.h>
#import <SyneriseSDK/SNRScreenViewAudience.h>

// Content Widget
#import <SyneriseSDK/SNRContentWidgetAppearance.h>
#import <SyneriseSDK/SNRContentWidgetLayout.h>
#import <SyneriseSDK/SNRContentWidgetHorizontalSliderLayout.h>
#import <SyneriseSDK/SNRContentWidgetGridLayout.h>
#import <SyneriseSDK/SNRContentWidgetItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetBasicProductItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetBadgeItemLayoutPartial.h>
#import <SyneriseSDK/SNRContentWidgetImageButtonCustomAction.h>
#import <SyneriseSDK/SNRContentWidgetOptions.h>
#import <SyneriseSDK/SNRContentWidgetRecommendationsOptions.h>
#import <SyneriseSDK/SNRContentWidgetRecommendationDataModel.h>
#import <SyneriseSDK/SNRContentWidgetBadgeDataModel.h>
#import <SyneriseSDK/SNRContentWidget.h>

// Notification Service/Content Extensions & Helpers
#import <SyneriseSDK/SNRNotificationServiceExtension.h>
#import <SyneriseSDK/SNRSingleMediaContentExtensionViewController.h>
#import <SyneriseSDK/SNRCarouselContentExtensionViewController.h>
#import <SyneriseSDK/SNRNotificationEncryptionHelper.h>
#import <SyneriseSDK/SNRNotificationConfigurationHelper.h>
#import <SyneriseSDK/SNRNotificationAnalyticsHelper.h>
