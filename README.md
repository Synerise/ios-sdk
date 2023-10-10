# Synerise iOS SDK (v4.14.6)

[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://github.com/synerise/ios-sdk)
[![Languages](https://img.shields.io/badge/language-Objective--C%20%7C%20Swift-orange.svg)](https://github.com/synerise/ios-sdk)
[![GitHub release](https://img.shields.io/github/release/Synerise/ios-sdk.svg)](https://github.com/Synerise/ios-sdk/releases) 
[![CocoaPods](https://img.shields.io/badge/pod-v4.14.6-green.svg)](https://cocoapods.org/pods/SyneriseSDK)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Synerise](https://img.shields.io/badge/www-synerise-green.svg)](https://synerise.com)
[![Documentation](https://img.shields.io/badge/docs-latest-green.svg)](https://help.synerise.com/)

---

## About
Synerise iOS SDK for Synerise platform (http://www.synerise.com).

## Documentation
Most up-to-date documentation is available at [Synerise Help Center - iOS SDK](https://help.synerise.com/developers/ios-sdk).

## Requirements
* Access to workspace
* A Profile API Key
* Xcode 15 and iOS SDK 17
* iOS 9.0+ minimum deployment target
* Valid architectures: arm64 devices and arm64, x86_64 simulators

## Install Synerise SDK from CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

```
gem install cocoapods
```

Once you have CocoaPods installed you should add below code into your Podfile in Xcode:

```
platform :ios, '14.0'
use_frameworks!

target YOUR_PROJECT_TARGET do
  pod 'SyneriseSDK'
end
```

## Install Synerise SDK from Carthage

Add following line to your Cartfile:
```
github "synerise/ios-sdk"
```

After that please update carthage:
```
carthage update
```

Go to your Xcode project's "General" settings. Open `<YOUR_XCODE_PROJECT_DIRECTORY>/Carthage/Build/iOS` in Finder and drag `SyneriseSDK.framework` to the "Embedded Binaries" section in Xcode.

Make sure `Copy items if needed` is selected and click `Finish`.


## Import Synerise SDK

You will need to import the **Synerise SDK** header into the files that contain code relating to **Synerise SDK**. 

**Swift:**
```
import SyneriseSDK
```

**Objective-C:**
```
<SyneriseSDK/SyneriseSDK.h>
```

In Objective-C, you can either include it in your AppName-Prefix.pch file.

## Initialization

First of all, you need to initialize Synerise iOS SDK in your AppDelegate and provide `Profile API Key`.

To get `Profile API Key`, please sign in to your Synerise account and visit [https://app.synerise.com/api](https://app.synerise.com/api).
Then, generate new `API Key` for `Profile` audience.

Configuration for **Synerise SDK** should be completely resolved before the end of `AppDelegate` `didFinishLaunchingWithOptions` method.

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	let clientApiKey = "YOUR_CLIENT_API_KEY"

	Synerise.initialize(clientApiKey: clientApiKey)
}
```

**Objective-C:**
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	static NSString *clientApiKey = @"YOUR_CLIENT_API_KEY";

	[SNRSynerise initializeWithClientApiKey:clientApiKey];
}
```
