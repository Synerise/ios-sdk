# Changelog
All notable changes to this project will be documented in this file.

## [3.2.4] - 2018-05-16

### Changed
- Swift naming convenction for some classes

## [3.2.3] - 2018-05-16

### Fixed
- SNRClientProfileContext class visibility to public

## [3.2.2] - 2018-05-16

### Added
- validation for email, password, birthdate, phone number in SDK methods (SDK throws exceptions)
- new method for fetching client profile information: Profile.getClient() 


## [3.2.1] - 2018-05-10

### Changed
- property type 'clientId' changed from NSInteger to NSNumber in SNRCreateClientContext model
- property type 'birthDate' changed from NSDate to NSString in few models: SNRClientAccountInformation, SNRClientUpdateAccountContext, SNRUpdateClientContext, SNRCreateClientContext


## [3.2.0] - 2018-05-09

### Added
- Preloading campaign banners
- Preloaded campaign banners can be triggered by events

### Changed
- Banner optional delegate methods


## [3.1.72] - 2018-05-04

### Changed
- Images load before showing mobile campaign (walkthrough, banner)


## [3.1.71] - 2018-04-26

### Changed
- New parameters in view tracking


## [3.1.70] - 2018-04-25
### Added
- Injector starts automatically or manually
- Walkthrough optional delegate methods
- Banner optional delegate methods
- Mandatory Update and First Run Message support
- New parameters to AppStartedEvent
- Placeholder while loading images

### Removed
- Welcome screen

### Changed
- SyneriseSDK optional delegate methods
- New uuid mechanism
