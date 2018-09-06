//
//  SyneriseSDK.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <SyneriseSDK/SNRSynerise.h>
#import <SyneriseSDK/SNRTracker.h>
#import <SyneriseSDK/SNRClient.h>
#import <SyneriseSDK/SNRProfile.h>
#import <SyneriseSDK/SNRInjector.h>

#import <SyneriseSDK/SNREvent.h>
#import <SyneriseSDK/SNRCustomEvent.h>
#import <SyneriseSDK/SNRLoggedInEvent.h>
#import <SyneriseSDK/SNRLoggedOutEvent.h>
#import <SyneriseSDK/SNRRegisteredEvent.h>
#import <SyneriseSDK/SNRAddedProductToCartEvent.h>
#import <SyneriseSDK/SNRAddedProductToFavoritesEvent.h>
#import <SyneriseSDK/SNRRemovedProductFromCartEvent.h>
#import <SyneriseSDK/SNRCancelledTransactionEvent.h>
#import <SyneriseSDK/SNRCompletedTransactionEvent.h>
#import <SyneriseSDK/SNRPushClickedEvent.h>
#import <SyneriseSDK/SNRPushViewedEvent.h>
#import <SyneriseSDK/SNRCancelledPushEvent.h>
#import <SyneriseSDK/SNRAppearedInLocationEvent.h>
#import <SyneriseSDK/SNRHitTimerEvent.h>
#import <SyneriseSDK/SNRSearchedEvent.h>
#import <SyneriseSDK/SNRSharedEvent.h>
#import <SyneriseSDK/SNRVisitedScreenEvent.h>
#import <SyneriseSDK/SNRTrackerParams.h>

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRUnitPrice.h>
#import <SyneriseSDK/SNREventProduct.h>
#import <SyneriseSDK/SNRCreateClientContext.h>
#import <SyneriseSDK/SNRUpdateClientContext.h>
#import <SyneriseSDK/SNRRegisterClientContext.h>
#import <SyneriseSDK/SNRClientPasswordResetRequestContext.h>
#import <SyneriseSDK/SNRClientPasswordResetConfirmationContext.h>
#import <SyneriseSDK/SNRCreateClientContext.h>
#import <SyneriseSDK/SNRClientProfileContext.h>
#import <SyneriseSDK/SNRClientAgreementsContext.h>
#import <SyneriseSDK/SNRClientUpdateAccountContext.h>
#import <SyneriseSDK/SNRClientAccountInformation.h>
#import <SyneriseSDK/SNRAnalyticsMetrics.h>
#import <SyneriseSDK/SNRClientSex.h>
#import <SyneriseSDK/SNRProfilePromotionResponse.h>
#import <SyneriseSDK/SNRProfilePromotion.h>
#import <SyneriseSDK/SNRClientPromotionResponse.h>
#import <SyneriseSDK/SNRClientPromotion.h>

#import <SyneriseSDK/SNRExceptionHandler.h>
#import <SyneriseSDK/SNRException.h>
#import <SyneriseSDK/SNRInvalidEmailException.h>
#import <SyneriseSDK/SNRInvalidPasswordException.h>
#import <SyneriseSDK/SNRInvalidPhoneNumberException.h>
#import <SyneriseSDK/SNRInvalidBirthdateException.h>
#import <SyneriseSDK/SNRIllegalArgumentException.h>
#import <SyneriseSDK/SNRPasswordIsNotEqualToSavedPasswordException.h>
#import <SyneriseSDK/SNRError.h>
#import <SyneriseSDK/SNRInvalidEmailError.h>
#import <SyneriseSDK/SNRInvalidPasswordError.h>
#import <SyneriseSDK/SNRInvalidPhoneNumberError.h>
#import <SyneriseSDK/SNRInvalidBirthdateError.h>
#import <SyneriseSDK/SNRIllegalArgumentError.h>
#import <SyneriseSDK/SNRPasswordIsNotEqualToSavedPasswordError.h>
