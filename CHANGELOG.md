# Changelog
All notable changes to this project will be documented in this file.

Note that Objective-C class names are prefixed by `SNR`. In the changelog below, these are names used in Swift, without the prefix.

## [3.9.1] - 2022-01-08

### Fixed
- Potential issue with native notification buttons when Simple Push campaign contains Rich Media (Single Media).


## [3.9.0] - 2022-02-08

### Fixed
- Analytics for Simple Push campaigns.


## [3.8.10] - 2021-12-12

### Added
- Optional badge as a text shown on the item in `ContentWidget`.
- Optional label (`topTextLabel`) to show additional information about product in `ContentWidget`.
- Label with percentage discount (if set `isDiscountPercentageVisible` in item layout) value shown before sale price in `ContentWidget`.

### Changed
- The SDK does not throw exception when data model mapping returns nil or required properties are nil.
- `ClientAuthenticationResult` is changed to `ClientConditionalAuthResult`.
- `ClientAuthenticationStatus` is changed to `ClientConditionalAuthStatus`.
- `ClientAuthenticationContext` is changed to `ClientConditionalAuthenticationContext`.

### Removed
- `salePriceMargin` setting property from `BasicProductItemLayout`.


## [3.8.9] - 2021-11-05

### Added
- Mapping `errorCode` in `ApiError`.


## [3.8.8] - 2021-11-02

### Fixed
- Potential issues with deprecated OAuth, Facebook and Apple Sign In methods.
- Potential issues with SDK reinitialization.
- Potential issues with merging anonymous profile when client has signed in.

### Added
- `context` parameter in `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)`


## [3.8.7] - 2021-10-15

### Fixed
- Potential issues with cleaning bearer token in HTTP requests.

### Changed
- `ClientSessionEndReason.ClientDeleted` is changed to `ClientSessionEndReason.UserAccountDeleted`.

### Added
- `ExactPrice` value in `PromotionDiscountType` model.


## [3.8.6] - 2021-09-28

### Added
- `ClientSessionEndReason.ClientDeleted` as reason when client deletes account.


## [3.8.5] - 2021-09-12

### Changed
- Internal validation for network request is disabled.


## [3.8.4] - 2021-09-06

### Fixed
- Issues with the SDK reinitialization process.


## [3.8.3] - 2021-09-01

### Fixed
- mapping `currentRedeemLimit` property in `Promotion` model.

### Changed
- nullability of properties in `Promotion` model.

### Added
- `lastingTime` property in `Promotion` model.
- `PromotionTypeHandbill` value in `PromotionType` model.

## [3.8.2] - 2021-08-22

### Fixed
- Issue with token refreshing occuring by SDK in version 3.8.1.

### Added
- `Promotions.activatePromotions(identifiers:success:failure:)` method.
- `Promotions.deactivatePromotions(identifiers:success:failure:)` method.
- `Promotion` model has got new properties.


## [3.8.1] - 2021-08-15

### Fixed
- dSYM content removed from inside framework bundle.


## [3.8.0] - 2021-08-09

### Added
- `Client.requestAccountActivationByPin(email:success:failure:)` method.
- `Client.confirmAccountActivationByPin(pinCode:email:success:failure:)` method.
- `SNRClientSessionEndReasonClientRejected` option in `SNRClientSessionEndReason` enumeration.

### Changed
- Improvements to stability.


## [3.7.6] - 2021-06-30

### Fixed
- UUID regeneration is performed automatically when the session is recovered from the client token after app reinstall.

### Added
- `Client.signInConditionally(email:password:success:failure:)` method.
- `Client.authenticateConditionally(token:clientIdentityProvider:authID:success:failure:)` method.
- `Client.authenticate(token:clientIdentityProvider:authID:success:failure:)` method.
- `ClientAuthenticationResult` model.
- `ClientAuthenticationStatus` enum.


## [3.7.5] - 2021-05-18

### Changed
- `VoucherStatus` is changed to `VoucherCodeStatus`.

### Fixed
- Client UUID is renewed after reinstallation when session is valid.


## [3.7.4] - 2021-04-15

### Fixed
- Potential issues in generating screen.content event.
- Compatibility both for `String` and `Data` types in method that uses Sign in with Apple.


## [3.7.3] - 2021-04-11

### Fixed
- Issue with Recommendations v2 mapping caused in previous version (3.7.2).
- Potential issue with sending double push.view event in some cases.

### Changed
- `AddedProductToCartEvent` is changed to `ProductAddedToCartEvent`.
- `RemovedProductFromCartEvent`  is changed to `ProductRemovedFromCartEvent`.
- `AddedProductToFavoritesEvent`  is changed to `ProductAddedToFavoritesEvent`.
- `ProductViewEvent` is changed to `ProductViewedEvent`.

### Added
- Additional UIKit classes excluded from AutoTracking.


## [3.7.2] - 2021-04-08

### Fixed
- `ScreenViewResponse` model mapping (`data` property issue).
- Potential issues with fetching Recommendations v1 campaign which is not compatible.

### Added
- More debug events.


## [3.7.1] - 2021-03-30

### Fixed
- Potential issues with regenerating anonymous after an account is deleted.

### Changed
- `CancelledPushEvent` name to `PushCancelledEvent`.
- `Client.requestEmailChange(email:password:success:failure:)` is deprecated.
- `Client.requestEmailChangeByFacebook(email:success:failure:)` is deprecated.

### Added
- `Client.requestEmailChange(email:password:externalToken:authID:success:failure:)` method.
- `Content.getScreenView(success:failure:)` method.


## [3.7.0] - 2021-02-24

### Changed
- Some of deprecated methods have been deleted.
- `NSError` is changed to `SNRApiError` in failure blocks in module methods.

### Added
- `ContentWidget` is supporting Recommendations v2.
- `ContentWidgetRecommendationOptions` configuration object for `ContentWidget`.
- `imageContentMode` in `ContentWidgetBasicProductItemLayout`.


## [3.6.27] - 2021-02-13

### Fixed
- Some issues with fetching notification encryption data when device is locked.


## [3.6.26] - 2021-01-27

### Fixed
- Issue with Push Notification registration after SDK is reinitialized.

### Added
- More debug logs.


## [3.6.25] - 2021-01-21

### Fixed
- Currency issues on `ContentWidget`.

### Changed
- Improvements to stability.


## [3.6.24] - 2021-01-12

### Fixed
- Issue that could have caused loading images with delay in campaigns.

### Changed
- UI improvements in Banner campaign.
- Improved appearance of Simple Push with Rich Media for Dark Mode.
- Improvements to stability.


## [3.6.23] - 2020-12-11

### Changed
- Improvements to stability.


## [3.6.22] - 2020-12-10

### Fixed
- Issue that causes not sending events for Walkthrough and Banner campaigns.


## [3.6.21] - 2020-12-07

### Fixed
- Issue that could have caused crash in `Client.retrieveToken(success:failure:)`. 
- Issue that fix crash in `ContentWidget` when displaying image in `BasicProductItemLayout`.

### Changed
- `[MODULE].setLoggingEnabled(_:)` methods are deprecated. Please use `Synerise.setDebugMode(_:)` only.

### Added
- Single Image Notification (Rich Media) displays title and body on extended view.


## [3.6.20] - 2020-12-01

### Fixed
- `InjectorWalkthroughDelegate` delegate method `snr_walkthroughDidLoad(walkthroughDictionary:)` is invoked when it is implemented instead of old method  `snr_walkthroughDidLoad()`.
- Preventing from displaying campaign when image resources are not formatted correctly.

### Changed
- SDK throws `SNRInternalInconsistencyError` when some settings options are configured after Synerise initialization but should be before.



## [3.6.19] - 2020-11-24

### Fixed
- Some issues with notification processing in `NotificationServiceExtension`.

### Added
- Walkthrough dictionary returned in `InjectorWalkthroughDelegate` delegate method `snr_walkthroughDidLoad(walkthroughDictionary:)`
- `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` method.
- New option to set whether events should be sent when server time synchronization has failed - `Synerise.settings.tracker.isBackendTimeSyncRequired`.

### Changed
- Information about device root is moved to AppStarted event.
- Improvements to stability.


## [3.6.18] - 2020-10-29

### Changed
- Improvements to stability.


## [3.6.17] - 2020-10-14

### Fixed
- Some issues with notification encryption configuration when regenerating data.
- Issue that could have caused crash in `SyneriseCrashHandler`. 

### Changed
- Debug logs contain simple module name, not a class name.
- Improvements to stability.

### Removed
- `Chat` module.


## [3.6.16] - 2020-09-28

### Added
- Image thumbnail in Rich Media (Single Media) Synerise notification.
- Dynamic interactive iOS buttons in Synerise notifications generated from Simple Push campaign.

### Changed
- Implementing encrypted notifications is now easier.


## [3.6.15] - 2020-09-07

### Added
- Support for encrypted notifications (enabled by `Synerise.settings.notifications.encryption`).


## [3.6.14] - 2020-08-24

### Added
- Events sends own occuring time to backend.

### Changed
- `Synerise.settings.notifications.appGroupIdentifier` is moved to `Synerise.settings.notifications.appGroupIdentifier`. The previous option is active but deprecated.


## [3.6.13] - 2020-07-16

### Added
- `automaticallyAdjustContentViewSize`  bool property for specify whether expanded notification should automatically adjust its size to downloaded image.


## [3.6.12] - 2020-07-07

### Fixed
- Issues with generating UUID for Apple Sign In authentication requests.

### Added
- `TokenOriginApple` in `TokenOrigin` enumeration type.


## [3.6.11] - 2020-07-01

### Added
-  `Client.authenticateByOAuthIfRegistered(accessToken:authID:success:failure:)` method.
-  `Client.authenticateByAppleSignInIfRegistered(identityToken:authID:success:failure:)` method.
- `Client.deleteAccountByOAuth(accessToken:success:failure:)` method.
- `Client.deleteAccountByAppleSignIn(identityToken:success:failure:)` method.
- `Synerise.settings.sdk.shouldDestroySessionOnApiKeyChange` in settings.

### Changed
- Maintaining session when changing clientApiKey within business profile.


## [3.6.10] - 2020-06-19

### Changed
- Improvements to stability.


## [3.6.9] - 2020-06-18 (removed from CocoaPods)

### Added
- Content mode settings for image views in Rich Media notifications.

### Changed
- Way of obfuscation in SDK to much pretty style.


## [3.6.8] - 2020-05-14

### Fixed
- Freezeing host app issue occuring sometimes by SDK in version 3.6.7.


## [3.6.7] - 2020-05-13

### Fixed
- Freezeing host app issue occuring sometimes by SDK in version 3.6.6.

### Added
-  `Client.refreshToken(sucess:failure:)` method.
- `Token` object has claims property with properties of token.

### Changed
- Improvements to stability.


## [3.6.6] - 2020-04-30

### Added
- Persistent events are sent when the app launches.

### Changed
- Improvements to stability.


## [3.6.5] - 2020-04-15

### Fixed
- Passing attributes property in OAuth authorization context.

### Added
- `Client.destroySession` method.
- `Client.regenerateUuid(clientIdentifier:)` method with customerIdentifier as input for regenerated uuid.
- Apple Sign In authorization (`Client.authenticateByAppleSignIn(context:authID:success:failure:)`).
- Swift names for some public classes.

### Changed
- Error codes for `Error` are enumeration type now.
- Improvements to stability.


## [3.6.4] - 2020-03-25

### Fixed
- saving events in persistent storage.


## [3.6.3] - 2020-03-16

### Fixed
- Issue with removing data from keychain when app is launched first.

### Added
- More information in `CrashEvent` from Crash Handler.


## [3.6.2] - 2020-03-02

### Changed
- Improvements to supporting synerise react native sdk.


## [3.6.1] - 2020-02-27

### Added
- `Synerise.setHostApplicationType` method to specify host app type.

### Changed
- `Tracker` tries to send events when app enters to foreground.
- Better handling when there is no internet connection.
- Improvements to stability.

## [3.6.0] - 2020-02-13

### Changed
- Improvements to stability.


## [3.5.20] - 2020-02-12

### Changed
- Security related changes.

### Removed
- `tags` property in `ClientUpdateAccountContext` and `ClientRegisterAccountContext`.


## [3.5.19] - 2020-01-23

### Added
- `authId` as `customId` in OAuth authorization payload.

### Changed
- Improvements in reinitialization mechanism (`Synerise.changeClientApiKey`).

## [3.5.18] - 2019-12-20

### Fixed
- `Promotion.priority` property added to sorting whitelist.
- Improving SDK stability


## [3.5.17] - 2019-12-12

### Added
- `priority` property in `Promotion` class.


## [3.5.16] - 2019-12-09

### Fixed
- Uncommon case with stop tracking events because of invalid events in batch.


## [3.5.15] - 2019-12-03

### Added
- Support multiple scenes in campaigns (walkthrough, banner etc.) for iOS 13.


## [3.5.14] - 2019-12-02

### Fixed
- `ContentWidgetImageButtonCustomAction` sends model in its receive click action.

### Added
- SDK persists its last and current version in application's data.

### Changed
- `PromotionResponse` mapping metadata to `PromotionResponseMetadata` object in metadata property.
- `Client.registerForPush(mobileAgreement:success:failure:)` is deprecated.


## [3.5.13] - 2019-11-22

### Fixed
- `ContentWidget` doesn't require productID parameter for recommendations.


## [3.5.12] - 2019-11-07

### Changed
- `Client.regenerateUUID` method regenerates client's UUID if session is anonymous.

### Fixed
- `Token.tokenString` property attributes.
- `ClientRegisterAccountContext.city` property mapping.

### Removed
- `ClientUpdateContext.lastActivityDate`.


## [3.5.11] - 2019-10-18

### Added
- `regularPriceFont` and `regularPriceFontColor` properties to `ContentWidgetBasicProductItemLayout`.
- `priceGroupSeparator` and `priceDecimalSeparator` properties  to `ContentWidgetBasicProductItemLayout`.


## [3.5.10] - 2019-10-16

### Added
- `Content.getDocuments(apiQuery:success:failure:)` method.


## [3.5.9] - 2019-10-08

### Added
- `Synerise.setCrashHandlingEnabled(_:)` to pass info about Users application crashes as dedicated events to the backend.


## [3.5.8] - 2019-09-27

### Added
- `ClientStateDelegate` for handling client sign-in state.


## [3.5.7] - 2019-09-20

### Added
- `SIGN_OUT` SDK Command.

### Changed
- `Chat` constructor requires `tracker_key`.


## [3.5.6] - 2019-09-10

### Added
- `Chat` module.

### Changed
- Improvements to stability.


## [3.5.5] - 2019-09-03

### Added
- `OTHER` option to `ClientSex`.


## [3.5.4] - 2019-08-19

### Added
- Sale price as a additional feature to `ContentWidge`.
- Optional button action as a additional feature to `ContentWidget`.


## [3.5.3] - 2019-08-12

### Added
- `Client.getEvents()` method.
- 'app-version' as a query parameter in walkthrough request.

### Changed
- Event's label max length is 64 characters.

## [3.5.2] - 2019-07-25

### Added
- `PromotionsApiQuery` object to fetch promotions better way.
- 'mobilePushAgreement' parameter in `Client.registerForPush()` method.

### Changed
- `WidgetGridLayout.getSize(prefferedWidth:)` name to `WidgetGridLayout.getSize(preferredWidth:)`.
- `Client.getPromotions(statuses:types:page:success:failure:)` is deprecated.
- `Client.getPromotions(statuses:types:limit:page:success:failure:)` is deprecated.
- `Client.getPromotions (statuses:types:limit:page:includeMeta:success:failure:)` is deprecated.


## [3.5.1] - 2019-07-10

### Fixed
- `ContentWidgetItemLayout.backgroundColor` - property type.
- Swift name for `RecommendationOptions` class.

### Changed
- Documentation in header files.


## [3.5.0] - 2019-06-30

### Added
- 'ContentWidget' with Slider and Grid Layouts.


## [3.4.14] - 2019-06-27

### Fixed
- Header annotation in `Client.recognizeAnonymous()`


## [3.4.13] - 2019-06-25

### Removed
- Transaction Events (`CompletedTransactionEvent`, `CancelledTransactionEvent`).

### Added
- Network information is sent in the `ApplicationStartedEvent`.
- Mobile Operator information is sent in the `ApplicationStartedEvent`.


## [3.4.12] - 2019-06-22

### Fixed
- `Client.setCustomEmail` and `Client.setCustomIdentifier` methods nullability.

### Removed
- Events don't contain 'time' parameter.

### Changed
- Improvements to networking.


## [3.4.11] - 2019-06-12

### Added
- `Client.retrieveToken(success:failure:)` method

### Changed
- `Client.getToken(success:failure:)'`is deprecated.


## [3.4.10] - 2019-06-04

### Fixed
- `Synerise.settings.sdk.minTokenRefreshInterval` option in settings.

## [3.4.9] - 2019-06-03

### Fixed
- `ClientRegisterAccountContext.tags` property is array now.

### Added
- New option to set time interval counting backwards from expiration time, within which token will be automatically refreshed by SDK  - `Synerise.settings.sdk.minTokenRefreshInterval`.

## [3.4.8] - 2019-05-21

### Fixed
- Dynamic change of AutoTrack mode.

### Added
- `Content` module.
- `Content.getDocument` method.
- Push Consent information is sent in the AppStartedEvent.

### Changed
- `Tracker.setConfiguration()` is deprecated.
- `Tracker.setAutoTrackMode()` is deprecated.
- `Tracker.setLocationAutomaticEnabled()` is deprecated.
- `Injector.setAutomatic()` is deprecated.


## [3.4.7] - 2019-04-26

### Fixed
- Mandatory Update campaign.


## [3.4.6] - 2019-04-09

### Fixed
- Improving SDK stability.


## [3.4.5] - 2019-04-08

### Added
- New option to disable whole SDK activity - `Synerise.settings.sdk.enabled`.
- New option to disable notifications activity - `Synerise.settings.notifications.enabled`.
- New option to disable auto tracking activity - `Synerise.settings.tracker.autoTracking.enabled`.
- New option to disable declarative tracking activity - `Synerise.settings.tracker.tracking.enabled`.


## [3.4.4] - 2019-04-04

### Changed
- `ProductViewEvent`, `RecommendationClickEvent` and `RecommendationSeenEvent` has changed its structure.


## [3.4.3] - 2019-03-29

### Changed
- Synerise API host.


## [3.4.2] - 2019-03-19

### Added
- New additional 'authID' parameter in `Client.authenticateByFacebook()` method.
- New additional 'authID' parameter in `Client.authenticateByOAuth()` method.

### Removed
- `authID` parameter (`ClientFacebookAuthenticationContext`, `ClientOAuthContext`).


## [3.4.1] - 2019-03-18

### Added
- New event classes (`ProductViewEvent`, `RecommendationSeenEvent`, `RecommendationClickEvent`).
- New additional `authID` parameter (`ClientFacebookAuthenticationContext`, `ClientOAuthContext`).

### Changed
- Simple Push campaign doesn't send 'push.received' event by now.


## [3.4.0] - 2019-03-08

### Added
- Posiibility to excluding compontents from autotracking by class.
- Posiibility to excluding components from autotracking by tag.

### Changed
- New structure and code organization for SDK settings (`SNRSynerise.settings`).
- Improvements to user anonymous session.


## [3.3.16] - 2019-03-01

### Changed
- Improvements to user anonymous session.


## [3.3.15] - 2019-02-27

### Changed
- Change to allow anonymous client using whole methods.


## [3.3.14] - 2019-02-21

### Added
- `Client.requestEmailChangeByFacebook()`.


## [3.3.13] - 2019-02-19

### Changed
- Improvements in oauth authentication.


## [3.3.12] - 2019-02-13

### Changed
- Improvements to user session handling.


## [3.3.11] - 2019-02-07

### Fixed
- Facebook authentication.

### Changed
- `Client.requestEmailChange()` method (newsleeterAgreement has been added to arguments).
- `Client.confirmEmailChange()` method (smsAgreement has been added to arguments).


## [3.3.10] - 2019-02-03

### Added
- `Client.authenticateByOAuth()` method.
- `Client.regenerateUUID()` method.

### Changed
- `Client.authenticateByFacebook()` method uses context optionally.
- `Client.requestEmailChange()` method.
- `Client.confirmEmailChange()` method.


## [3.3.9] - 2019-01-23

### Added
- `Synerise.isSyneriseSimplePush()` method.
- `Synerise.isSyneriseSilentCommand()` method.
- `Synerise.isSyneriseSilentSDKCommand()` method.
- `Synerise.isSyneriseBanner()` method.

### Changed
- Autotracking events.


## [3.3.8] - 2019-01-16

### Added
- `Client.authenticateByFacebook()` method.
- `Client.authenticateByFacebookIfRegistered()` method.
- `Client.requestEmailChange()` method.
- `Client.confirmEmailChange()` method.
- `Client.deleteAccountByFacebook()` method.

### Removed
- `Client.authenticateByFacebookToken()` method.

### Changed
- `Client.getToken()` returns token and its origin (SYNERISE, FACEBOOK, OAUTH or UNKNOWN).

### Fixed
- Improving SDK stability.


## [3.3.7] - 2019-01-09

### Added
- `Synerise.locationAutomatic()` method to obtain user location and send location event automatically.

### Fixed
- Improving SDK stability.


## [3.3.6] - 2018-12-18

### Changed
- `Client.deleteAccount()` method.


## [3.3.5] - 2018-12-16

### Added
- `Client.confirmAccount()` method.

### Changed
- `Client.deleteAccount()` method requires password.

### Fixed
- `Client.updateAccount()` method. Unless sex property in update context is set, api request payload doesn't contain it.

### Removed
- `Client.registerAccount()` method option to registration without email.


## [3.3.4] - 2018-12-12

### Fixed
- `Promotions.getPromotions()`.


## [3.3.3] - 2018-12-06

### Fixed
- `Promotions.getPromotionByUuid()`.
- `Promotions.getPromotionByCode()`.


## [3.3.2] - 2018-11-28

### Added
- `Synerise.setDebugModeEnabled()` to eneable logs from all modules.

### Changed
- `Loyalty` module is renamed to `Promotions`.
- `CacheService` is replaced by `CacheManager`.
- New functionality in `SNRApiError` (see Error Handling section in README).
- Synerise SDK invokes all delegation methods on main thread.

### Fixed
- Improving Synerise SDK stability.
- Optimisation of networking in Synerise SDK.


## [3.3.1] - 2018-11-21

### Fixed
- Method name for Swift: `Client.registerClient()` -> `Client.registerAccount()`.
- Improving SDK stability.


## [3.3.0] - 2018-11-20

### Added
- `Loyalty` module.
- `CacheService` to obtain cached API models.

### Changed
- SDK callbacks executes on main thread.
- Some Promotion entity fields types.
- Some Promotion enum types (`PromotionStatus`, `PromotionType`, `PromotionDiscountValue`).
- Major parts of authorization module.
- `Client.changePassword()` now requires old client's password.
- Profile methods were distributed between Client and Loyalty.
- `Client.getPromotions()` -> `Loyalty.getPromotions()`.
- `Client.getPromotion()` -> `Loyalty.getPromotion()`.
- `Client.activatePromotionBy()` -> `Loyalty.activatePromotionBy()`.
- `Client.deactivatePromotionBy()` -> `Loyalty.deactivatePromotionBy()`.
- `Client.getOrAssignVoucher()` -> `Loyalty.getOrAssignVoucher()`.
- `Client.assignVoucherCode()` -> `Loyalty.assignVoucherCode()`.
- `Client.getAssignedVoucherCodes()` -> `Loyalty.getAssignedVoucherCodes()`.
- `Profile.registerClient()` -> `Client.registerAccount()`.
- `Profile.registerForPush()` -> `Client.registerForPush()`.
- `Profile.activateClient()` -> `Client.activateAccount()`.
- `Profile.requestPasswordReset()` -> `Client.requestPasswordReset()`.
- `Profile.confirmResetPassword()` -> `Client.confirmPasswordReset()`.

### Removed
- Overall validation.
- `Profile` module.
- `Client.getAnalytics()` method.
- `Client.setConfiguration()` method.
- `Client.createAuthToken()` method.


## [3.2.30] - 2018-11-01

### Added
- Notifications with Rich Media now can have URL actions.

### Changed
- Removed validation for email, birthdate and phone number in several functions in the SDK.
- Added argument validation for nonnull argument in Client and Profile modules (SDK throw `InvalidArgumentException`).


## [3.2.29] - 2018-10-23

### Fixed
- Issue with logout and client's auto refresh.

### Added
- Client method to obtain client's authorization token by Facebook token.
- `ApiError` class with more information from backend system.


## [3.2.28] - 2018-10-18

### Fixed
- Improving SDK stability.


## [3.2.27] - 2018-10-15

### Added
- Option to disable In App Push Notification Alerts.

### Changed
- Client models structure (`ClientAccountInformation`, `ClientUpdateContext`).
- `ClientSex` is now enum type instead of object.

### Removed
- `ClientAgreeementsContext` model (use `ClientAgreeementsContext` instead).


## [3.2.26] - 2018-10-05

### Added
- Client method to obtain external client's authorization token.
- Simple Push campaign sends events to Synerise.
- Password validation is removed in the entire SDK.

### Changed
- Synerise SDK can be initialized at any moment of the application's lifecycle.

### Fixed
- Public methods are more orderly and better described.


## [3.2.25] - 2018-09-26

### Added
- Assign voucher Profile and Client API methods.
- Get assigned vouchers Profile and Client API methods.
- Get or assign voucher Profile and Client API methods.
- New method to deactivate promotion by uuid.
- New method to deactivate promotion by code.
- New method to fetch promotions data with limit parameter.
- New method to fetch promotions data with statuses and expiration options.

### Changed
- Promotions API models structure (`ClientPromotion`, `ProfilePromotion`).
- Method `Profile.activateAccount()` changed to `Profile.activateClient()`.
- Method `Profile.confirmAccount()` changed to `Profile.confirmPhoneRegistration()`.
- Method `Profile.resetPassword()` changed to `Profile.requestPasswordReset()`.


## [3.2.24] - 2018-09-18

### Changed
- Registration method doesn't throw but invoke failure with error.

### Fixed
- Improving SDK stability.


## [3.2.23] - 2018-09-06

### Added
- New Client change password feature (old password validation).

### Fixed
- Improving SDK stability.


## [3.2.22] - 2018-09-03

### Fixed
- Improving SDK stability.


## [3.2.21] - 2018-08-30

### Fixed
- Registration with pool ID.


## [3.2.20] - 2018-08-29

### Added
- New Client change password feature.
- New method to create account without activation.


## [3.2.19] - 2018-08-16

### Added
- Method to request update of phone number.
- Method to confirm update of phone number.
- Method to activate account manually.


## [3.2.18] - 2018-08-13

### Added
- Promotions API integration.


## [3.2.17] - 2018-08-02

### Changed
- Walkthrough and banners appearance.

### Fixed
- SDK stability.


## [3.2.16] - 2018-07-06

### Added
- Bitcode support.
- Option to change API baseURL for on-premise installations.

### Fixed
- Campaign Banners appearance.


## [3.2.15] - 2018-07-03

### Changed
- Synerise activities are now presented via own UIWindow.


## [3.2.14] - 2018-06-28

### Fixed
- Email validator to support all TLDs.


## [3.2.13] - 2018-06-26

### Added
- Automated customId assignation from code pool upon client registration.


## [3.2.12] - 2018-06-22

### Added
- Method to get current client's UUID.
- customId property in `ClientProfileContext`.
- improvements for exceptions/errors handling in obj-c/swift.

### Fixed
- Profile.createClient.


## [3.2.11] - 2018-06-21

### Fixed
- `Profile.deleteClient()`.


## [3.2.10] - 2018-06-18

### Added
- Added analytic matrics support.
- Method to check client is signed in.


## [3.2.9] - 2018-06-11

### Added
- Configuration options for Client (client auto refresh).
- Option to auto refresh client's login.
- Method to set client's email for Tracker.

### Changed
- Method to set client identifier in Tracker.
- Improvement in SDK logging (framework version information added).


## [3.2.8] - 2018-05-29

### Added
- Configuration options for Tracker.

### Changed
- clientId in Tracker is String object by now.


## [3.2.7] - 2018-05-28

### Changed
- Default settings for event sending.


## [3.2.6] - 2018-05-24

### Changed
- Improvements for campaign automation support.


## [3.2.5] - 2018-05-24

### Added
- Option to register with phone number and confirmation with code received by phone.
- Option to login with phone number and password.

### Fixed
- Swift method names (incorrect parameter names in some classes).


## [3.2.4] - 2018-05-16

### Changed
- Swift naming convenction for some classes.


## [3.2.3] - 2018-05-16

### Fixed
- `ClientProfileContext` class visibility to public.


## [3.2.2] - 2018-05-16

### Added
- Validation for email, password, birthdate, phone number in SDK methods (SDK throws exceptions).
- New method for fetching client profile information: `Profile.getClient()`.


## [3.2.1] - 2018-05-10

### Changed
- Property type 'clientId' changed from NSInteger to NSNumber in `CreateClientContext` model.
- Property type 'birthDate' changed from NSDate to NSString in few models: `ClientAccountInformation`, `ClientUpdateAccountContext`, `UpdateClientContext`, `CreateClientContext`.


## [3.2.0] - 2018-05-09

### Added
- Preloading campaign banners.
- Preloaded campaign banners can be triggered by events.

### Changed
- Banner optional delegate methods.


## [3.1.72] - 2018-05-04

### Changed
- Images load before showing mobile campaign (walkthrough, banner).


## [3.1.71] - 2018-04-26

### Changed
- New parameters in view tracking.


## [3.1.70] - 2018-04-25

### Added
- Injector starts automatically or manually.
- Walkthrough optional delegate methods.
- Banner optional delegate methods.
- Mandatory Update and First Run Message support.
- New parameters to AppStartedEvent.
- Placeholder while loading images.

### Removed
- Welcome screen.

### Changed
- SyneriseSDK optional delegate methods.
- New uuid mechanism.
