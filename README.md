# Synerise iOS SDK (v4.14.6) - User documentation

[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://github.com/synerise/ios-sdk)
[![Languages](https://img.shields.io/badge/language-Objective--C%20%7C%20Swift-orange.svg)](https://github.com/synerise/ios-sdk)
[![GitHub release](https://img.shields.io/github/release/Synerise/ios-sdk.svg?style=flat-square)](https://github.com/Synerise/ios-sdk/releases) 
[![CocoaPods](https://img.shields.io/badge/pod-v4.14.6-green.svg)](https://cocoapods.org/pods/SyneriseSDK)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Documentation](https://img.shields.io/badge/docs-latest-brightgreen.svg?style=flat-square)](https://help.synerise.com/)

---

## Documentation

Most up-to-date documentation is available at [Synerise Help Center - iOS SDK](https://help.synerise.com/developers/ios-sdk).

## Requirements

* Xcode 14 and iOS SDK 16
* iOS 9.0+ minimum deployment target
* Valid architectures: arm64 devices and arm64, x86_64 simulators

## Install Synerise SDK from CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

```
gem install cocoapods
```

Once you have CocoaPods installed you should add below code into your Podfile in Xcode:

```
platform :ios, '9.0'
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


## Setup

1. Under your application targets "Build Settings" configuration find the "Other Linker Flags" property and set it to "-ObjC".
2. In your application plist file (often called "Info.plist") add a row for "Required background modes" of type Array. It then needs: "App downloads content in response to push notifications".
3. If you are going to use http addresses (instead only https), you will need to change whitelist domains in your app by adding the following to your application's plist (often called "Info.plist"):

```
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key><true/>
</dict>
```


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
	Synerise.setDebugModeEnabled(true)
}
```

**Objective-C:**
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	static NSString *clientApiKey = @"YOUR_CLIENT_API_KEY";

	[SNRSynerise initializeWithClientApiKey:clientApiKey];
	[SNRSynerise setDebugModeEnabled:YES];
}
```

**IMPORTANT**: It is not recommended to use debug mode in a release version of your application.
