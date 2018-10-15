# Changelog
All notable changes to this project will be documented in this file.

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
- Bitcode support
- Option to change API baseURL for on-premise installations.

### Fixed
- Campaign Banners appearance.


## [3.2.15] - 2018-07-03

### Changed
- Synerise activities are now presented via own UIWindow


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
