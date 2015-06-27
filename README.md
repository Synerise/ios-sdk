# SyneriseSDK

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate SyneriseSDK software into your apps. For more info about Synerise visit the [Synerise Website](http://synerise.com)

## Supported iOS Versions

As Synerise relies on iBeacon support the SDK only performs functionality on iOS 7 (see supported devices http://support.apple.com/kb/HT6048). 
Valid Architectures: armv7 armv7s i386 arm64
Minimum iOS Deployment Target: 5.1
Base SDK support: iOS 8


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SyneriseSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SyneriseSDK"
```

Under your application targets "Build Settings" configuration find the "Other Linker Flags" property and set it to "-ObjC".

You'll need to import the <SyneriseSDK/SyneriseSDK.h> header into the files that contain code relating to Synerise. You can either add them to individual files or include it in your AppName-Prefix.pch file.

	#import "<SyneriseSDK/SyneriseSDK.h>"


In your application plist file (often called "Info.plist") add a row for "Required background modes" of type Array. It then needs:

- "App downloads content in response to push notifications"

To support updates in iOS 8 you need to add the following Cocoa Keys to the plist.

```ruby
<key>NSLocationAlwaysUsageDescription</key>
<string>Required for ios 8 compatibilty</string>
```

### Get Synerise API Key
If you haven't done so already, login to Synerise to get your Synerise API Key.

## Author

Synerise, developer@synerie.com

## License

SyneriseSDK is available under the MIT license. See the LICENSE file for more info.










