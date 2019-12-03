# Changelog
All notable changes to this project will be documented in this file.

## [3.5.15] - 2019-12-03

### Added
- Support multiple scenes in campaigns (walkthrough, banner etc.) for iOS 13.


## [3.5.14] - 2019-12-02

### Fixed
- `SNRContentWidgetImageButtonCustomAction` sends model in its receive click action.

### Added
- SDK persists its last and current version in application's data.

### Changed
- `SNRPromotionResponse` mapping metadata to `SNRPromotionResponseMetadata` object in metadata property.
- `SNRClient.registerForPush:mobileAgreement:success:failure:` is deprecated.


## [3.5.13] - 2019-11-22

### Fixed
- `SNRContentWidget` doesn't require productID parameter for recommendations.


## [3.5.12] - 2019-11-07

### Changed
- `SNRClient.regenerateUUID` method regenerates client's UUID if session is anonymous.

### Fixed
- `SNRToken.tokenString` property attributes.
- `SNRClientRegisterAccountContext.city` property mapping.

### Removed
- `SNRClientUpdateContext.lastActivityDate`.


## [3.5.11] - 2019-10-18

### Added
- `regularPriceFont` and `regularPriceFontColor` properties to `SNRContentWidgetBasicProductItemLayout`.
- `priceGroupSeparator` and `priceDecimalSeparator` properties  to `SNRContentWidgetBasicProductItemLayout`.


## [3.5.10] - 2019-10-16

### Added
- `SNRContent.getDocuments(apiQuery:success:failure:)` method.


## [3.5.9] - 2019-10-08

### Added
- `Synerise.setCrashHandlingEnabled(_:)` to pass info about Users application crashes as dedicated events to the backend.


## [3.5.8] - 2019-09-27

### Added
- `SNRClientStateDelegate` for handling client sign-in state.


## [3.5.7] - 2019-09-20

### Added
- `SIGN_OUT` SDK Command.

### Changed
- `SNRChat` constructor requires `tracker_key`.


## [3.5.6] - 2019-09-10

### Added
- `SNRChat` module.

### Changed
- Improvements to stability.


## [3.5.5] - 2019-09-03

### Added
- `OTHER` option to `SNRClientSex`.


## [3.5.4] - 2019-08-19

### Added
- Sale price as a additional feature to 'ContentWidget'.
- Optional button action as a additional feature to 'ContentWidget'.


## [3.5.3] - 2019-08-12

### Added
- 'Client.getEvents' method.
- 'app-version' as a query parameter in walkthrough request.

### Changed
- Event's label max length is 64 characters.

## [3.5.2] - 2019-07-25

### Added
- 'SNRPromotionsApiQuery' object to fetch promotions better way.
- 'mobilePushAgreement' parameter in 'Client.registerForPush' method.

### Changed
- 'SNRWidgetGridLayout.getSize(prefferedWidth:)' name to 'SNRWidgetGridLayout.getSize(preferredWidth:)'.
- 'SNRClient.getPromotions(statuses:types:page:success:failure:)' is deprecated.
- 'SNRClient.getPromotions(statuses:types:limit:page:success:failure:)' is deprecated.
- 'SNRClient.getPromotions (statuses:types:limit:page:includeMeta:success:failure:)' is deprecated.


## [3.5.1] - 2019-07-10

### Fixed
- 'ContentWidgetItemLayout.backgroundColor' - property type.
- Swift name for 'RecommendationOptions' class.

### Changed
- Documentation in header files.


## [3.5.0] - 2019-06-30

### Added
- 'ContentWidget' with Slider and Grid Layouts.


## [3.4.14] - 2019-06-27

### Fixed
- Header annotation in 'SNRClient.recognizeAnonymous'


## [3.4.13] - 2019-06-25

### Removed
- Transaction Events ('SNRCompletedTransactionEvent', 'CancelledTransactionEvent').

### Added
- Network information is sent in the AppStartedEvent.
- Mobile Operator information is sent in the AppStartedEvent.


## [3.4.12] - 2019-06-22

### Fixed
- 'SNRClient.setCustomEmail' and 'SNRClient.setCustomIdentifier' methods nullability.

### Removed
- Events don't contain 'time' parameter.

### Changed
- Improvements to networking.


## [3.4.11] - 2019-06-12

### Added
- 'SNRClient.retrieveToken(success:failure:)' method

### Changed
- 'SNRClient.getToken(success:failure:)' is deprecated.


## [3.4.10] - 2019-06-04

### Fixed
- 'SNRSynerise.settings.sdk.minTokenRefreshInterval' option in settings.

## [3.4.9] - 2019-06-03

### Fixed
- 'SNRClientRegisterAccountContext.tags' parameter is array now.

### Added
- New option to set time interval counting backwards from expiration time, within which token will be automatically refreshed by SDK  - 'SNRSynerise.settings.sdk.minTokenRefreshInterval'.

## [3.4.8] - 2019-05-21

### Fixed
- Dynamic change of AutoTrack mode.

### Added
- 'SNRContent' module.
- 'SNRContent.getDocument' method.
- Push Consent information is sent in the AppStartedEvent.

### Changed
- 'SNRTracker.setConfiguration:' is deprecated.
- 'SNRTracker.setAutoTrackMode:' is deprecated.
- 'SNRTracker.setLocationAutomaticEnabled:' is deprecated.
- 'SNRInjector.setAutomatic:' is deprecated.


## [3.4.7] - 2019-04-26

### Fixed
- Mandatory Update campaign.


## [3.4.6] - 2019-04-09

### Fixed
- Improving SDK stability.


## [3.4.5] - 2019-04-08

### Added
- New option to disable whole SDK activity - 'Synerise.settings.sdk.enabled'.
- New option to disable notifications activity - 'Synerise.settings.notifications.enabled'.
- New option to disable auto tracking activity - 'Synerise.settings.tracker.autoTracking.enabled'.
- New option to disable declarative tracking activity - 'Synerise.settings.tracker.tracking.enabled'.


## [3.4.4] - 2019-04-04

### Changed
- ProductViewEvent, RecommendationClickEvent and RecommendationSeenEvent has changed its structure.


## [3.4.3] - 2019-03-29

### Changed
- Synerise API host.


## [3.4.2] - 2019-03-19

### Added
- New additional 'authID' parameter in Client.authenticateByFacebook method.
- New additional 'authID' parameter in Client.authenticateByOAuth method.

### Removed
- 'authID' parameter (ClientFacebookAuthenticationContext, ClientOAuthContext).


## [3.4.1] - 2019-03-18

### Added
- New event classes (ProductViewEvent, RecommendationSeenEvent, RecommendationClickEvent).
- New additional 'authID' parameter (ClientFacebookAuthenticationContext, ClientOAuthContext).

### Changed
- Simple Push campaign doesn't send 'push.received' event by now.


## [3.4.0] - 2019-03-08

### Added
- Posiibility to excluding compontents from autotracking by class.
- Posiibility to excluding components from autotracking by tag.

### Changed
- New structure and code organization for SDK settings (SNRSynerise.settings).
- Improvements to user anonymous session.


## [3.3.16] - 2019-03-01

### Changed
- Improvements to user anonymous session.


## [3.3.15] - 2019-02-27

### Changed
- Change to allow anonymous client using whole methods.


## [3.3.14] - 2019-02-21

### Added
- Client.requestEmailChangeByFacebook.


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
- Client.requestEmailChange method (newsleeterAgreement has been added to arguments).
- Client.confirmEmailChange method (smsAgreement has been added to arguments).


## [3.3.10] - 2019-02-03

### Added
- Client.authenticateByOAuth method.
- Client.regenerateUUID method.

### Changed
- Client.authenticateByFacebook method uses context optionally.
- Client.requestEmailChange method.
- Client.confirmEmailChange method.


## [3.3.9] - 2019-01-23

### Added
- Synerise.isSyneriseSimplePush method.
- Synerise.isSyneriseSilentCommand method.
- Synerise.isSyneriseSilentSDKCommand method.
- Synerise.isSyneriseBanner method.

### Changed
- Autotracking events.


## [3.3.8] - 2019-01-16

### Added
- Client.authenticateByFacebook method.
- Client.authenticateByFacebookIfRegistered method.
- Client.requestEmailChange method.
- Client.confirmEmailChange method.
- Client.deleteAccountByFacebook method.

### Removed
- Client.authenticateByFacebookToken method.

### Changed
- Client.getToken returns token and its origin (SYNERISE, FACEBOOK, OAUTH or UNKNOWN).

### Fixed
- Improving SDK stability.


## [3.3.7] - 2019-01-09

### Added
- Synerise.locationAutomatic(boolean) method to obtain user location and send location event automatically.

### Fixed
- Improving SDK stability.


## [3.3.6] - 2018-12-18

### Changed
- Client.deleteAccount method.


## [3.3.5] - 2018-12-16

### Added
- Client.confirmAccount method.

### Changed
- Client.deleteAccount method requires password.

### Fixed
- Client.updateAccount method. Unless sex property in update context is set, api request payload doesn't contain it.

### Removed
- Client.registerAccount method option to registration without email.


## [3.3.4] - 2018-12-12

### Fixed
- Promotions.getPromotions.


## [3.3.3] - 2018-12-06

### Fixed
- Promotions.getPromotionByUuid.
- Promotions.getPromotionByCode.


## [3.3.2] - 2018-11-28

### Added
- Synerise.setDebugModeEnabled to eneable logs from all modules.

### Changed
- Loyalty module is renamed to Promotions.
- CacheService is replaced by CacheManager.
- New functionality in SNRApiError (see Error Handling section in README).
- Synerise SDK invokes all delegation methods on main thread.

### Fixed
- Improving Synerise SDK stability.
- Optimisation of networking in Synerise SDK.


## [3.3.1] - 2018-11-21

### Fixed
- Method name for Swift: Client.registerClient -> Client.registerAccount.
- Improving SDK stability.


## [3.3.0] - 2018-11-20

### Added
- Loyalty module.
- CacheService to obtain cached API models.

### Changed
- SDK callbacks executes on main thread.
- Some Promotion entity fields types.
- Some Promotion enum types (PromotionStatus, PromotionType, PromotionDiscountValue).
- Major parts of authorization module.
- Client.changePassword() now requires old client's password.
- Profile methods were distributed between Client and Loyalty.
- Client.getPromotions -> Loyalty.getPromotions.
- Client.getPromotion -> Loyalty.getPromotion.
- Client.activatePromotionBy -> Loyalty.activatePromotionBy.
- Client.deactivatePromotionBy -> Loyalty.deactivatePromotionBy.
- Client.getOrAssignVoucher -> Loyalty.getOrAssignVoucher.
- Client.assignVoucherCode -> Loyalty.assignVoucherCode.
- Client.getAssignedVoucherCodes -> Loyalty.getAssignedVoucherCodes.
- Profile.registerClient -> Client.registerAccount.
- Profile.registerForPush -> Client.registerForPush.
- Profile.activateClient -> Client.activateAccount.
- Profile.requestPasswordReset -> Client.requestPasswordReset.
- Profile.confirmResetPassword -> Client.confirmPasswordReset.

### Removed
- Overall validation.
- Profile module.
- Client.getAnalytics method.
- Client.setConfiguration method.
- Client.createAuthToken method.


## [3.2.30] - 2018-11-01

### Added
- Notifications with Rich Media now can have URL actions.

### Changed
- Removed validation for email, birthdate and phone number in several functions in the SDK.
- Added argument validation for nonnull argument in Client and Profile modules (SDK throw SNRInvalidArgumentException).


## [3.2.29] - 2018-10-23

### Fixed
- Issue with logout and client's auto refresh.

### Added
- Client method to obtain client's authorization token by Facebook token.
- SNRApiError class with more information from backend system.


## [3.2.28] - 2018-10-18

### Fixed
- Improving SDK stability.


## [3.2.27] - 2018-10-15

### Added
- Option to disable In App Push Notification Alerts.

### Changed
- Client models structure (ClientAccountInformation, ClientUpdateContext).
- ClientSex is now enum type instead of object.

### Removed
- ClientAgreeementsContext model (use ClientAgreeementsContext instead).


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
- Promotions API models structure (ClientPromotion, ProfilePromotion).
- Method Profile.activateAccount changed to Profile.activateClient.
- Method Profile.confirmAccount changed to Profile.confirmPhoneRegistration.
- Method Profile.resetPassword changed to Profile.requestPasswordReset.


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
- customId property in ClientProfileContext.
- improvements for exceptions/errors handling in obj-c/swift.

### Fixed
- Profile.createClient.


## [3.2.11] - 2018-06-21

### Fixed
- Profile.deleteClient.


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
- SNRClientProfileContext class visibility to public.


## [3.2.2] - 2018-05-16

### Added
- Validation for email, password, birthdate, phone number in SDK methods (SDK throws exceptions).
- New method for fetching client profile information: Profile.getClient().


## [3.2.1] - 2018-05-10

### Changed
- Property type 'clientId' changed from NSInteger to NSNumber in SNRCreateClientContext model.
- Property type 'birthDate' changed from NSDate to NSString in few models: SNRClientAccountInformation, SNRClientUpdateAccountContext, SNRUpdateClientContext, SNRCreateClientContext.


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
