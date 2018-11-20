//
//  SyneriseSDK.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <SyneriseSDK/SNRSynerise.h>
#import <SyneriseSDK/SNRTracker.h>
#import <SyneriseSDK/SNRClient.h>
#import <SyneriseSDK/SNRInjector.h>
#import <SyneriseSDK/SNRLoyalty.h>

#import <SyneriseSDK/SNRNotificationServiceSettings.h>

#import <SyneriseSDK/SNRCacheService.h>

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
#import <SyneriseSDK/SNRBaseContext.h>
#import <SyneriseSDK/SNRClientAgreements.h>
#import <SyneriseSDK/SNRClientSex.h>
#import <SyneriseSDK/SNRUnitPrice.h>
#import <SyneriseSDK/SNREventProduct.h>
#import <SyneriseSDK/SNRClientRegisterAccountContext.h>
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

#import <SyneriseSDK/SNRExceptionHandler.h>
#import <SyneriseSDK/SNRException.h>
#import <SyneriseSDK/SNRInvalidArgumentException.h>
#import <SyneriseSDK/SNRIllegalArgumentException.h>
#import <SyneriseSDK/SNRError.h>
#import <SyneriseSDK/SNRErrorsList.h>
#import <SyneriseSDK/SNRApiError.h>
#import <SyneriseSDK/SNRInvalidArgumentError.h>
#import <SyneriseSDK/SNRIllegalArgumentError.h>

#import <SyneriseSDK/SNRSingleMediaContentExtensionViewController.h>
#import <SyneriseSDK/SNRCarouselContentExtensionViewController.h>
