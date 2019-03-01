# Synerise iOS SDK (v3.3.16) - User documentation

[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://github.com/synerise/ios-sdk)
[![Languages](https://img.shields.io/badge/language-Objective--C%20%7C%20Swift-orange.svg)](https://github.com/synerise/ios-sdk)
[![CocoaPods](https://img.shields.io/badge/pod-v3.3.16-green.svg)](https://cocoapods.org/pods/SyneriseSDK)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/Synerise/ios-sdk/blob/master/LICENSE)

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate **Synerise SDK** software into your apps. For more info about Synerise visit the [Synerise Website](http://synerise.com).



# Requirements

* Xcode 9 and iOS SDK 11
* iOS 9.0+ target deployment
* Valid architectures: armv7, armv7s, arm64 devices and i386, x86_64 simulators



# Installation

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



# Configuration

## Dependencies

**Synerise SDK** requires Firebase with Messaging service so you have to import these dependencies for CocoaPods or Carthage.

Note: more about Firebase configuration - [get started with Firebase iOS](https://firebase.google.com/docs/storage/ios/start).


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

First of all, you need to initialize Synerise iOS SDK in your AppDelegate and provide `Client API Key`.

To get `Client API Key`, please sign in to your Synerise account and visit [https://app.synerise.com/api](https://app.synerise.com/api).
Then, generate new `API Key` for `Client` audience.

Configuration for **Synerise SDK** should be completely resolved before the end of `AppDelegate` `didFinishLaunchingWithOptions` method.

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	let clientApiKey = "YOUR_CLIENT_API_KEY"

	Synerise.initialize(clientApiKey: clientApiKey) // 1
	Synerise.setDebugModeEnabled(true) // 2
	Synerise.setDelegate(self) // 3

	Tracker.setAutoTrackMode(.fine) // 4

	let trackerConfiguration = TrackerConfiguration();
	trackerConfiguration.minBatchSize = 10;
	trackerConfiguration.maxBatchSize = 100;
	trackerConfiguration.autoFlushTimeout = 10.0;

	Tracker.setConfiguration(trackerConfiguration); // 5

	Injector.setAutomatic(true) // 6
	Injector.setWalkthroughDelegate(self) // 7
	Injector.setBannerDelegate(self) // 8
}
```

**Objective-C:**
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	static NSString *clientApiKey = @"YOUR_CLIENT_API_KEY";

	[SNRSynerise initializeWithClientApiKey:clientApiKey]; // 1
	[SNRSynerise setDebugModeEnabled:YES]; //2
	[SNRSynerise setDelegate:self]; // 3
	
	[SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine]; // 4

	SNRTrackerConfiguration trackerConfiguration;
	trackerConfiguration.minBatchSize = 10;
	trackerConfiguration.maxBatchSize = 100;
	trackerConfiguration.autoFlushTimeout = 10.0f;
	
	[SNRTracker setConfiguration:trackerConfiguration]; // 5

	[SNRInjector setAutomatic:YES]; // 6
	[SNRInjector setWalkthroughDelegate:self]; // 7
	[SNRInjector setBannerDelegate:self]; // 8
}
```

Let's dive into some configurable functionalities:  
1. `Synerise.initialize` - Initializes **Synerise SDK**.  
2. `Synerise.setDebugModeEnabled` - Enables debug mode for **Synerise SDK**. See **Debug logs** section for more information.  
3. `Synerise.setDelegate` - Sets delegate to handle actions from **Synerise SDK**. See **Synerise SDK delegate** section for more information.  
4. `Tracker.setAutoTrackMode` - Sets proper mode for view tracking. See **Tracker** section for more information.  
5. `Tracker.setConfiguration` - Sets custom configuration for Tracker module.
6. `Injector.setAutomatic` - Fetches your Injector content right away. See **Injector** section for more information.  
7. `Injector.setWalkthroughDelegate` - Sets delegate to handle walkthrough actions. See **Injector** section for more information.  
8. `Injector.setBannerDelegate` - Sets delegate to handle banner actions. See **Injector** section for more information.  

## Initialization with custom API environment

There is option to change API baseURL for on-premise installations.  

One thing you have to do for that is using different initialization method:

**Swift:**
```swift
let clientApiKey = "YOUR_CLIENT_API_KEY"
let apiBaseUrl = "YOUR_API_BASE_URL"

Synerise.initialize(clientApiKey: clientApiKey, baseUrl: apiBaseUrl)
```

**Objective-C:**
```objective-c
static NSString *clientApiKey = @"YOUR_CLIENT_API_KEY";
static NSString *apiBaseUrl = @"YOUR_API_BASE_URL";

[SNRSynerise initializeWithClientApiKey:clientApiKey andBaseUrl:apiBaseUrl];
```


## Debug logs

It is not recommended to use debug mode in a release version of your app.

You can enable debug logs for **Synerise SDK** by method `Synerise.setDebugModeEnabled`. It enables logging for all modules.

**Swift:**
```swift
Synerise.setDebugModeEnabled(true)
```

**Objective-C:**
```objective-c
[SNRSynerise setDebugModeEnabled:YES];
```


However, it might be enabled or disabled for each module by method `setLoggingEnabled`.

**Swift:**
```swift
Tracker.setLoggingEnabled(true)
```

**Objective-C:**
```objective-c
[SNRTracker setLoggingEnabled(YES];
```

- **Tracker**: you can receive some simple logs about sending events by enabling debug mode, which is disabled by default.
- **Client**: you can receive some simple logs about client actions by enabling debug mode, which is disabled by default.
- **Promotions**: you can receive some simple logs about promotions and vouchers actions by enabling debug mode, which is disabled by default.
- **Injector**: you can receive some simple logs about Injector actions by enabling debug mode, which is disabled by default.


## Synerise SDK delegate

You can specify your custom action when a user clicks on simple push, banner or walkthrough.
**Synerise SDK** implements two main actions that user may invoke - open URL and Deeplink.

There is one more method when **Synerise SDK** needs re-registration for push notifications.

**Swift:**
```swift
// MARK: - SyneriseDelegate
    
// optional method - Synerise SDK needs registration for push notifications again
// it is optional but if you use push notifications, it is required
// sample implementation
func snr_registerForPushNotificationsIsNeeded() {
	if let fcmToken: String = Messaging.messaging().fcmToken {
		Client.registerForPush(registrationToken: fcmToken, success: { (success) in
			//...
		}) { (error) in
			//...
		}
	}
}

// optional method - basic implementation for handling url
// sample implementation
func snr_handledAction(url: URL) {
	if UIApplication.shared.canOpenURL(url) {
		if #available(iOS 10, *) {
			UIApplication.shared.open(url, options:[:], completionHandler:nil)
		} else {
			UIApplication.shared.openURL(url)
		}
	}
}

// optional method - basic implementation for handling deeplink
// implementation has to be customed
func snr_handledAction(deepLink: String) {
	//...
}

// optional method - advanced implementation for handling url
// when this method is implemented, it will be called instead of snr_handledAction(url:)
// sample implementation
func snr_handledAction(url: URL, activity: SyneriseActivity, completionHandler: @escaping SyneriseActivityCompletionHandler) {
	if activity == .walkthrough {
		completionHandler(.none, {
			if UIApplication.shared.canOpenURL(url) {
				if #available(iOS 10, *) {
    				UIApplication.shared.open(url, options:[:], completionHandler:nil)
				} else {
    				UIApplication.shared.openURL(url)
				}
			}
		})

		return
	}

	if activity == .banner || activity == .simplePush {
		completionHandler(.hide, {
			//...
		})

		return
	}
}

// optional method - advanced implementation for handling deeplink
// when this method is implemented, it will be called instead of snr_handledAction(deepLink:)
// implementation has to be customed
func snr_handledAction(deepLink: String, activity: SyneriseActivity, completionHandler: @escaping SyneriseActivityCompletionHandler) {
	//...
}
```

**Objective-C:**
```objective-c
#pragma mark - SNRSyneriseDelegate

// optional method - Synerise SDK needs registration for push notifications again
// it is optional but if you use push notifications, it is required
// sample implementation
- (void)SNR_registerForPushNotificationsIsNeeded {
	NSString *fcmToken = [FIRMessaging messaging].FCMToken;
	if (fcmToken) {
		[SNRClient registerForPush:fcmToken success:^(BOOL isSuccess) {
			//...
		} failure:^(NSError * _Nonnull error) {
			//...
		}];
	}
}

// optional method - basic implementation for handling url
// sample implementation
- (void)SNR_handledActionWithURL:(NSURL*)url {
	if ([[UIApplication sharedApplication] canOpenURL:url ]) {
		if (@available(iOS 10, *)) {
			[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
		} else {
			[[UIApplication sharedApplication] openURL:url];
		}
	}
}

// optional method - basic implementation for handling deeplink
// implementation has to be customed
- (void)SNR_handledActionWithDeepLink:(NSString*)deepLink {
	//...
}

// optional method - advanced implementation for handling url
// when this method is implemented, it will be called instead of snr_handledAction(url:)
// sample implementation
- (void)SNR_handledActionWithURL:(NSURL*)url activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler {
	if (activity == SNRSyneriseActivityWalkthrough) {
		completionHandler(SNRSyneriseActivityActionNone, ^{
			if ([[UIApplication sharedApplication] canOpenURL:url ]) {
				if (@available(iOS 10, *)) {
					[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
				} else {
					[[UIApplication sharedApplication] openURL:url];
				}
			}
		});

		return;
	}

	if (activity == SNRSyneriseActivitySimplePush || activity == SNRSyneriseActivityBanner) {
		completionHandler(SNRSyneriseActivityActionHide, ^{
			//...
		});

		return;
	}
}

// optional method - advanced implementation for handling deeplink
// when this method is implemented, it will be called instead of snr_handledAction(deepLink:)
// implementation has to be customed
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler {
	//...
}
```



# Push Notifications

## Configure push notifications

When you want to use the full functionality of **Synerise SDK**, you have to configure Push Notifications. It works with help Firebase Messaging service. 

Following steps must be done:
1. Start Firebase service.
2. Set Firebase Messaging delegate.
3. Register for Apple Push Notifications.
4. Implement Firebase Messaging service.
5. Invoke **Synerise SDK** method for push registration and pass FCM Token.

Note: more about Firebase configuration - [get started with Firebase iOS](https://firebase.google.com/docs/storage/ios/start).

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	FirebaseApp.configure()
	Messaging.messaging().delegate = self
	//...
	//...
	//...
	
	if #available(iOS 10, *) {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
			//...
		}
	} else {
		let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
		application.registerUserNotificationSettings(settings)
	}

	application.registerForRemoteNotifications()
}

// MARK: - MessagingDelegate

func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
	Client.registerForPush(registrationToken: fcmToken, success: { (success) in
		//...
	}) { (error) in
		//...
	}
}
```

**Objective-C:**
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[FIRApp configure];
	[FIRMessaging messaging].delegate = self;
	//...
	//...
	//...

	if (@available(iOS 10, *)) {
		[UNUserNotificationCenter currentNotificationCenter].delegate = self;
		UNAuthorizationOptions authOptions = (UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge);
		[[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
			//...
		}];
	} else {
		UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
		UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];

		[[UIApplication sharedApplication] registerUserNotificationSettings:settings];
	}

	[[UIApplication sharedApplication] registerForRemoteNotifications];
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
	[SNRClient registerForPush:fcmToken success:^(BOOL isSuccess) {
		//...
	} failure:^(NSError * _Nonnull error) {
		//...
	}];
}
```


## Handling push notifications

In order to display push message and banners properly, you have to pass incoming push notification payload to **Synerise SDK** in your AppDelegate:

**Swift:**
```swift
// iOS 9

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
	let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		Synerise.handleNotification(userInfo)
	} else {
		//...
	}
}

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
	let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		Synerise.handleNotification(userInfo)
		completionHandler(.noData)
	} else {
		//...
	}
}

func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
	let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		Synerise.handleNotification(userInfo)
		completionHandler()
	} else {
		//...
	}
}

// iOS 10 and above
// MARK: - UNUserNotificationCenterDelegate

@available(iOS 10.0, *)
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
	let userInfo = response.notification.request.content.userInfo
	
	let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		Synerise.handleNotification(userInfo)
		completionHandler()
	} else {
		//...
	}
}

@available(iOS 10.0, *)
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
	let userInfo = notification.request.content.userInfo

	let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		Synerise.handleNotification(userInfo)
		completionHandler(UNNotificationPresentationOptions.init(rawValue: 0))
	} else {
		//...
	}
}
```

**Objective-C:**
```objective-c
// iOS 9

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
	BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
	if (isSyneriseNotification) {
		[SNRSynerise handleNotification:userInfo];
	} else {
		//...
	}
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
	BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
	if (isSyneriseNotification) {
		[SNRSynerise handleNotification:userInfo];
		completionHandler(UIBackgroundFetchResultNoData);
	} else {
		//...
	}
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
	BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
	if (isSyneriseNotification) {
		[SNRSynerise handleNotification:userInfo];
		completionHandler();
	} else {
		//...
	}
}


// iOS 10 and above
// pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(10) {
	NSDictionary *userInfo = response.notification.request.content.userInfo;

	BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
	if (isSyneriseNotification) {
		[SNRSynerise handleNotification:userInfo];
		completionHandler();
	} else {
	//...
	}
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler NS_AVAILABLE_IOS(10) {
	NSDictionary *userInfo = notification.request.content.userInfo;

	BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
	if (isSyneriseNotification) {
		[SNRSynerise handleNotification:userInfo];
		completionHandler(UNNotificationPresentationOptionNone);
	} else {
		//...
	}
}
```

**IMPORTANT**

If you have your own Push Notifications implementation, you can disable In App Notification Alerts from **Synerise SDK**.  
Just set one configuration option in two ways.
  
First approach:

**Swift:**
```swift
Synerise.notificationServiceSettings.disableInAppAlerts = true
```

**Objective-C:**
```objective-c
SNRSynerise.notificationServiceSettings.disableInAppAlerts = YES;
```

Second approach:

**Swift:**
```swift
NotificationServiceSettings.shared.disableInAppAlerts = true
```

**Objective-C:**
```objective-c
[SNRNotificationServiceSettings sharedInstance].disableInAppAlerts = YES;
```


## Rich Media push notifications

At this point, Simple Push Campaign has two types of Rich Media extensions:
- Single Media
- Image Carousel

### Requirements

To add this feature in your Simple Push Campaigns, you have to:
* have correctly configured synerise push notifications
* create Notification Content Extension - separately for each type of Rich Media
* configure App Group for main application and its extensions - please, read Apple documentation

### Configuration

Synerise SDK does most of the work needed and provides classes for Notification Content Extensions. When you create an extension, you just have to make it inherited from Synerise SDK suitable class.

Example for Single Media Notification Extension:

```swift
import UIKit
import UserNotifications
import UserNotificationsUI
import SyneriseSDK

class NotificationViewController: SingleMediaContentExtensionViewController, UNNotificationContentExtension {

    func didReceive(_ notification: UNNotification) {
        NotificationServiceSettings.shared().appGroupIdentifier = "YOUR_APP_GROUP_IDENTIFIER"
        setSyneriseNotification(notification)
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        setSyneriseNotificationResponse(response, completionHandler: completion)
    }
}
```

**IMPORTANT**  

You have to remember about correct configuration in your extension \*.plist file. See our code in Sample Swift App.


In main application, you have to set notifications categories with right identifiers. You must take it from Synerise SDK constants to make these working. But you can feel at free in naming buttons.

```swift
	let singleMediaCategory = UNNotificationCategory(identifier: SNRSingleMediaContentExtensionViewControllerCategoryIdentifier, actions: [], intentIdentifiers: [], options: [])
        
	let carouselPrevious = UNNotificationAction(identifier: SNRCarouselContentExtensionViewControllerPreviousItemIdentifier, title: "Previous", options: [])
	let carouselAction = UNNotificationAction(identifier: SNRCarouselContentExtensionViewControllerChooseItemIdentifier, title: "Go!", options: UNNotificationActionOptions.foreground)
        
	let carouselNext = UNNotificationAction(identifier: SNRCarouselContentExtensionViewControllerNextItemIdentifier, title: "Next", options: [])
        
	let carouselCategory = UNNotificationCategory(identifier: SNRCarouselContentExtensionViewControllerCategoryIdentifier, actions: [carouselPrevious, carouselAction, carouselNext], intentIdentifiers: [], options: [])
        
	UNUserNotificationCenter.current().setNotificationCategories([singleMediaCategory, carouselCategory])
```

Our Sample App shows configuration and extensions:  
https://github.com/Synerise/ios-sdk/tree/master/SampleAppSwift.


# Features

## Errors handling

### API Errors

We've created an error wrapper `SNRApiError` to handle API errors. It inherits from standard iOS object for errors - `NSError`. 

### Features

#### `getType`
`SNRApiErrorType.Http` - it's returned when request succeeded to execute, but something went wrong and error code is returned (e.g. 403).  
`SNRApiErrorType.Network` - it's returned when request failed to execute (e.g. due to no Internet connection).  
`SNRApiErrorType.UnauthorizedSession` - it's returned when session is invalid for given request.  
`SNRApiErrorType.Unknown` - it's returned when unknown error occurred (e.g. no response from server when expected).  

#### `getHttpCode`
Returns http status code. If request failed to execute (e.g. due to no Internet connection), this value will be equal -1.

#### `getBody`
Returns description parsed from response's error causes list. May be null if error type is different than `SNRApiErrorType.Http`.

### Example

When we receive an error, we can check if error is `SNRApiError` instance and then, there is possibility to get more information and get a list of all errors that occurred. 

Therefore, you can better integrate your own application with the **Synerise SDK**.

This example shows sample way to handle `SNRApiError`:

**Swift:**
```swift
func presentAlert(title: String, message: String) {
	let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

	let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
	alertController.addAction(okAction)

	self.present(alertController, animated: true, completion: nil)
}

func showErrorInfo(_ error: NSError, title: String = "Error", debug: Bool = true) {
	if let apiError = error as? SNRApiError {
		var apiErrorDebugInfo: String = String()

		let apiErrorType: SNRApiErrorType = apiError.getType()

		switch (apiErrorType) {
		case .network: apiErrorDebugInfo.append("NETWORK ERROR")
		case .unauthorizedSession: apiErrorDebugInfo.append("UNAUTHORIZED SESSION ERROR")
		case .http: apiErrorDebugInfo.append("HTTP ERROR: \(apiError.getHttpCode())")
		case .unknown: apiErrorDebugInfo.append("UNKNOWN ERROR")
		}

		apiErrorDebugInfo.append("\n\n")
		apiErrorDebugInfo.append("\(apiError.localizedDescription)")

		// first approach
		if let apiErrorCauses = apiError.errors, !apiErrorCauses.isEmpty {
			apiErrorDebugInfo.append("\n\n")

			apiErrorCauses.forEach({ (error) in
				let apiErrorCause: NSError = error as NSError

				var apiErrorCauseString: String = String()
				apiErrorCauseString.append("CODE: \(apiErrorCause.code)")
				apiErrorCauseString.append("\n")
				apiErrorCauseString.append("MESSAGE: \(apiErrorCause.localizedDescription)")

				apiErrorDebugInfo.append(apiErrorCauseString)
				apiErrorDebugInfo.append("\n\n")
			})
		}

		// second approach
		// apiErrorDebugInfo.append("\n\n")
		//
		// let apiErrorCauseString: String = apiError.getBody() ?? ""
		// apiErrorDebugInfo.append(apiErrorCauseString)

		self.presentAlert(title: "Debug SNRApiError", message: apiErrorDebugInfo)

		if debug {
			DebugUtils.print("\(title) \(apiError.code) \(apiError.localizedDescription)")
		}

		return
	}

	if debug {
		DebugUtils.print("\(title) \(error.code) \(error.localizedDescription)")
	}
}

func signIn(email: String, password: String) {
	Client.signIn(email: email, password: password, deviceId: nil, success: { (success) in
		//...
	}, failure: { (error) in
		self.showErrorInfo(error as NSError)
	})
}
```

**Objective-C:**
```objective-c
[SNRClient signInWithEmail:email password:password deviceId:nil success:^(BOOL isSuccess) {

} failure:^(NSError * _Nonnull error) {
	if ([error isKindOfClass:[SNRApiError class]]) {
		SNRApiError *apiError = (SNRApiError *)error;

		NSLog(apiError.localizedFailureReason) // print information string about all issues
		NSLog(apiError.errors) // print list of error objects about issues that occured
	}
}];
```

## Cache Manager

When your API request failed, you can still get cached response if available.

For example:

**Swift:**
```swift
let clientAccountInformation: ClientAccountInformation? = CacheManager.get(ClientAccountInformation.self) as? ClientAccountInformation
```

**Objective-C:**
```objective-c
SNRClientAccountInformation *clientAccountInformation = [CacheManager get:ClientAccountInformation.class];
```

At this point, **Synerise SDK** caches:
* `ClientAccountInformation` after successful Client.getAccount() response.



# Tracker

**Synerise SDK** provides you with powerful features for User Activity Tracking that you can use within your mobile application.

## Tracker Configuration

**Swift:**
```swift
var trackerConfiguration: TrackerConfiguration = TrackerConfiguration();
trackerConfiguration.minBatchSize = 1;
trackerConfiguration.maxBatchSize = 100;
trackerConfiguration.autoFlushTimeout = 2.0;
    
[Tracker setConfiguration:trackerConfiguration];
```

**Objective-C:**
```objective-c
SNRTrackerConfiguration trackerConfiguration;
trackerConfiguration.minBatchSize = 1;
trackerConfiguration.maxBatchSize = 100;
trackerConfiguration.autoFlushTimeout = 2.0f;
    
[SNRTracker setConfiguration:trackerConfiguration];
```

**MIN BATCH SIZE** - This parameter sets a minimum number of events in queue required to send them.

**MAX BATCH SIZE** - This parameter sets a maximum number of events, which may be sent in a single batch.

**AUTO FLUSH TIMEOUT** - This parameter sets the time required to elapse before event's queue will attempt to be sent.


## View tracking

Auto-tracking is functionality available in **Synerise SDK** that can attach to nearly everything within your application and log events automatically that you can then make use of within Synerise.

By default functionality is disabled and in order to enable it you need to use code like this:

**Swift:**
```swift
Tracker.setAutoTrackMode(.fine)
```

**Objective-C:**
```objective-c
[SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine];
```

Accepted values for setAutoTrackMode(mode) method:

**EAGER** - listeners are set to on touch events only.

**PLAIN** - listeners are set to on click events only.

**FINE** - listeners are attached to nearly everything in your app (even to activities and `viewDidAppear:` method to record VisitedScreen events).

**DISABLED** - listeners are disabled.


## Event tracking

To send some events just use `Tracker.send(_:)` method:

**Swift:**
```swift
let event: CustomEvent = CustomEvent(label: "YOUR_LABEL", action: "YOUR_ACTION")
Tracker.send(event)
```

**Objective-C:**
```objective-c
SNRCustomEvent *event = [[SNRCustomEvent alloc] initWithLabel:@"YOUR_LABEL" action:@"YOUR_ACTION"];
[SNRTracker send:event];
```

You can also pass your custom parameters:

**Swift:**
```swift
let parameters: TrackerParams = TrackerParams.make {
	builder in
	
	builder.setString("John", forKey: "name")
	builder.setInt(27, forKey: "age")
	builder.setBool(true, forKey: "isGreat")
	builder.setDouble(384.28, forKey: "lastOrder")
	builder.setInt(10, forKey: "count")
	builder.setObject(SampleObject(), forKey: "someObject")
}
        
let event: CustomEvent = CustomEvent(label: "YOUR_LABEL", action: "YOUR_ACTION", params: parameters)
Tracker.send(event)
```

**Objective-C:**
```objective-c
SNRTrackerParams *parameters = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder *builder) {
	[builder setString:@"John" forKey:@"name"];
	[builder setInt:27 forKey:@"age"];
	[builder setBool:YES forKey:@"isGreat"];
	[builder setDouble:384.28 forKey:@"lastOrder"];
	[builder setInt:10 forKey:@"count"];
	[builder setObject:[SampleObject new] forKey:@"someObject"];
}];
    
SNRCustomEvent *event = [[SNRCustomEvent alloc] initWithLabel:@"YOUR_LABEL" action:@"YOUR_ACTION" andParams:parameters];
[SNRTracker send:event];
```

Tracker caches and enqueues all your events locally, so they all will be sent when possible.


## Events

#### Session Events
Group of events related to user's session.

* `LoggedInEvent` - record a 'client logged in' event.

* `LoggedOutEvent` - record a 'client logged out' event.

* `RegisteredEvent` - record a 'client registered' event.


#### Products Events
Group of events related to products and cart.

* `AddedProductToFavoritesEvent` - record a 'client added product to favorites' event.

* `AddedProductToCartEvent` - record a 'client added product to cart' event.

* `RemovedProductFromCartEvent` - record a 'client removed product from cart' event.


#### Transaction Events
Group of events related to user's transactions.

* `CancelledTransactionEvent` - record a 'client cancelled transaction' event.

* `CompletedTransactionEvent` - record a 'client completed transaction' event.


#### Other Events
Group of uncategorized events related to user's location and actions.

* `AppearedInLocationEvent` - record a 'client appeared in location' event.

* `HitTimerEvent` - record a 'client hit timer' event. This could be used for profiling or activity time monitoring - you can send "hit timer" when your client starts doing something and send it once again when finishes, but this time with the different time signature. Then you can use our analytics engine to measure e.g. average activity time.

* `SearchedEvent` - record a 'client searched' event.

* `SharedEvent` - record a 'client shared' event.

* `VisitedScreenEvent` - record a 'client visited screen' event.

* `CustomEvent` - this is the only event which requires `action` field.


## Features

#### `Tracker.setCustomIdentifier(_:)`
Your custom identifier will be sent within every event in event params.

**Swift:**
```swift
Tracker.setCustomIdentifier("CUSTOM_IDENTIFIER")
```


#### `Tracker.setCustomEmail(_:)`
Your custom email will be sent within every event in event params.

**Swift:**
```swift
Tracker.setCustomEmail("CUSTOM_EMAIL")
```


#### `Tracker.flushEvents(completionHandler:)`
Sends events from queue to server by force.

**Swift:**
```swift
Tracker.flushEvents {
	// a block to be executed when SNRTracker has finished flushing events to Synerise servers, no matter the result.
}
```



# Client

## Features

#### `Client.registerAccount(context:success:failure:)`
Registers new client account.

**Swift:**
```swift
let email: String = "EMAIL"
let password: String = "PASSWORD"

let agreements: ClientAgreements = ClientAgreements()
agreements.email = true
agreements.push = true

let context: ClientRegisterAccountContext = ClientRegisterAccountContext.init(email: email, password: password)
context.firstName = "FIRST_NAME"
context.lastName = "LAST_NAME"
context.agreements = agreements

Client.registerAccount(context: context, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.activateAccount(email:success:failure:)`
Activates client's account.

**Swift:**
```swift
Client.activateAccount(email: email, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.signIn(email:password:deviceId:success:failure:)`
Signs in a client in order to obtain the JWT token, which could be used in subsequent requests.

**Swift:**
```swift
let email: String = "EMAIL"
let password: String = "PASSWORD"

Client.signIn(email: email, password: password, deviceId: nil, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.authenticateByFacebook(facebookToken:success:failure:)`
Signs in a client with Facebook Token.

**Swift:**
```swift
guard let facebookToken = FBSDKAccessToken.current()?.tokenString else {
	return
}
        
Client.authenticateByFacebook(facebookToken: facebookToken, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.authenticateByFacebookIfRegistered(facebookToken:success:failure:)`
Signs in a registered client with Facebook Token.

**Swift:**
```swift
guard let facebookToken = FBSDKAccessToken.current()?.tokenString else {
	return
}
        
Client.authenticateByFacebookIfRegistered(facebookToken: facebookToken, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```

#### `Client.authenticateByOAuth(accessToken:success:failure:)`
Signs in a client with OAuth Access Token.

**Swift:**
```swift
let accesToken: String = "ACCESS TOKEN"

Client.authenticateByOAuth(accessToken: accesToken, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.isSignedIn`
Checks whether client is signed in (is client's token not expired).

**Swift:**
```swift
func isSignedIn() -> Bool {
	return Client.isSignedIn()
}
```


#### `Client.signOut()`
Signs out client.

**Swift:**
```swift
func signOut() {
	Client.signOut()
}
```


#### `Client.getToken(success:failure:)`
Retrieves current client's token. This method provides valid token if client is signed in and current token is not expired.

**Swift:**
```swift
Client.getToken(success: { (token) in
	// success
}) { (error) in
	// failure
}
```


#### `Client.getUUID()`
Retrieves current client's UUID.

**Swift:**
```swift
func getUUID() -> String {
	return Client.getUUID()
}
```

#### `Client.regenerateUUID()`
Regenerates client's UUID.

**Swift:**
```swift
func getRegeneratedUUID() -> String {
	Client.regenerateUUID();

	return Client.getUUID()
}
```


#### `Client.getAccount(success:failure:)`
Get client's account information.

**Swift:**
```swift
Client.getAccount(success: { (clientAccountInformation) in
	// success
	print(clientAccountInformation.firstName)
	print(clientAccountInformation.lastName)
}) { (error) in
	// failure
}
```


#### `Client.updateAccount(success:failure:)`
Updates client's account information.

**Swift:**
```swift
let context: ClientUpdateAccountContext = ClientUpdateAccountContext()
context.firstName = "FIRST_NAME"
context.lastName = "LAST_NAME"
context.sex = ClientSex.male

Client.updateAccount(context: context, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.requestPasswordReset(context:success:failure:)`
Requests client's password reset with email. A client will receive a token on the provided email address in order to use.

**Swift:**
```swift
let context: ClientPasswordResetRequestContext = ClientPasswordResetRequestContext(email: "EMAIL")

Client.requestPasswordReset(context: context, success: { (success) in
	// success
}, failure: { (error) in
	// failure
}) 
```


#### `Client.confirmResetPassword(context:success:failure:)`
Confirms client's password reset with new password and token provided.

**Swift:**
```swift
let context: ClientPasswordResetConfirmationContext = ClientPasswordResetConfirmationContext(password: "PASSWORD", token: "TOKEN")

Client.confirmResetPassword(context: context, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.changePassword(password:oldPassword:success:failure:)`
Changes client's password.

**Swift:**
```swift
let password: String = "PASSWORD"
let oldPassword: String = "OLD_PASSWORD"

Client.changePassword(password: password, oldPassword: oldPassword, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```

#### `Client.requestEmailChange(email:password:success:failure:)`
Requests client's email change.

**Swift:**
```swift
let email: String = "EMAIL"
let password: String = "PASSWORD"

Client.requestEmailChange(email: email, password: password, success: { _ in
	// success
}) { (error) in
	// failure
}
```


#### `Client.confirmEmailChange(token:success:failure:)`
Confirms client's email change with provided token.

**Swift:**
```swift
let token: String = "TOKEN"

Client.confirmEmailChange(token: token, success: { _ in
	// success
}) { (error) in
	// failure
}
```


#### `Client.requestPhoneUpdate(phone:success:failure:)`
Requests client's phone update. A client will receive a code on the provided phone in order to use.

**Swift:**
```swift
let phone: String = "123456789"

Client.requestPhoneUpdate(phone: phone, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.confirmPhoneNumber(phone:confirmationCode:success:failure:)`
Confirms client's phone update with code provided.

**Swift:**
```swift
let phone: String = "123456789"
let confirmationCode: String = "CONFIRMATION_CODE"

Client.confirmPhoneUpdate(phone: phone, confirmationCode: confirmationCode, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.deleteAccount(success:failure:)`
Deletes client's account information.

**Swift:**
```swift
Client.deleteAccount(success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```

#### `Client.deleteAccountByFacebook(facebookToken:success:failure:)`
Deletes client's account information by Facebook.

**Swift:**
```swift
guard let facebookToken = FBSDKAccessToken.current()?.tokenString else {
	return
}

showLoading()
Client.deleteAccountByFacebookToken(facebookToken: facebookToken, success: { (isSuccess) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Client.registerForPush(registrationToken:success:failure:)`
Registers user for push notifications.

**Swift:**
```swift
let fcmToken: String = Messaging.messaging().fcmToken //FCM Token, it should be returned from FIRMessagingDelegate

Client.registerForPush(registrationToken: fcmToken,
	// success
}, failure: { (error) in
	// failure
})
```



# Promotions

## Features

#### `Promotions.getPromotions(success:failure:)`
Gets all available promotions that are defined for this client.

**Swift:**
```swift
Promotions.getPromotions(success: { (promotionResponse) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Promotions.getPromotions(statuses:types:page:success:failure:)`
Gets promotions that are defined for parameters provided.

#### `Promotions.getPromotions(statuses:types:limit:page:success:failure:)`
Gets promotions that are defined for parameters provided.

#### `Promotions.getPromotions(statuses:types:limit:page:includeMeta:success:failure:)`
Gets promotions that are defined for parameters provided.

**Swift:**
```swift
var statuses: [NSNumber] = [NSNumber]()
statuses.append(PromotionStatus.active.rawValue as NSNumber)
statuses.append(PromotionStatus.assigned.rawValue as NSNumber)

var types: [NSNumber] = [NSNumber]()
types.append(PromotionType.membersOnly.rawValue as NSNumber)
types.append(PromotionType.custom.rawValue as NSNumber)

let limit: Int = 100
let page: Int = 0
let includeMeta: Bool = false

Promotions.getPromotions(statuses: statuses, types: types, limit: limit, page: page, includeMeta: includeMeta, success: { (promotionResponse) in
	// success
	print(promotionResponse.items)
}, failure: { (error) in
	// failure
})
```


#### `Promotions.getPromotion(uuid:success:failure:)`
Gets promotion that are defined for UUID parameter provided.

**Swift:**
```swift
let UUID: String = "UUID"

Promotions.getPromotion(uuid: UUID, success: { (promotion) in
	// success
	print(promotion.code)
	print(promotion.discountValue)
}, failure: { (error) in
	// failure
})
```


#### `Promotions.getPromotion(code:success:failure:)`
Gets promotion that are defined for code parameter provided.

**Swift:**
```swift
let code: String = "CODE"

Promotions.getPromotion(code: code, success: { (promotion) in
	// success
	print(promotion.code)
	print(promotion.discountValue)
}, failure: { (error) in
	// failure
})
```


#### `Promotions.activatePromotion(uuid:success:failure:)`
Activates promotion that are defined for UUID parameter provided.

**Swift:**
```swift
let UUID: String = "UUID"

Promotions.activatePromotion(uuid: UUID, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Promotions.activatePromotion(code:success:failure:)`
Activates promotion that are defined for code parameter provided.

**Swift:**
```swift
let code: String = "CODE"

Promotions.activatePromotion(code: code, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Promotions.deactivatePromotion(uuid:success:failure:)`
Dectivates promotion that are defined for UUID parameter provided.

**Swift:**
```swift
let UUID: String = "UUID"

Promotions.deactivatePromotion(uuid: UUID, success: { (success) in
	//success
}, failure: { (error) in
	//failure
})
```


#### `Promotions.deactivatePromotion(code:success:failure:)`
Dectivates promotion that are defined for code parameter provided.

**Swift:**
```swift
let code: String = "CODE"

Promotions.deactivatePromotion(code: code, success: { (success) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Promotions.getOrAssignVoucher(poolUUID:success:failure:)`
Gets voucher code only once or assign voucher with provided pool UUID for the client.

**Swift:**
```swift
let poolUUID: String = "POOL_UUID"

Promotions.getOrAssignVoucher(poolUUID: poolUUID, success: { (assignVoucherResponse) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Promotions.assignVoucherCode(poolUUID:success:failure:)`
Assigns voucher with provided pool UUID for the client.

**Swift:**
```swift
let poolUUID: String = "POOL_UUID"

Promotions.assignVoucherCode(poolUUID: poolUUID, success: { (assignVoucherResponse) in
	// success
}, failure: { (error) in
	// failure
})
```


#### `Promotions.getAssignedVoucherCodes(success:failure:)`
Gets client's voucher codes.

**Swift:**
```swift
Promotions.getAssignedVoucherCodes(success: { (voucherCodesResponse) in
	// success
}, failure: { (error) in
	// failure
})
```



# Injector

Injector is designed to be simple to develop with, allowing you to integrate Synerise Mobile Content into your apps easily.

## Walkthrough

**Synerise SDK** provides multiple functionalities within Walkthrough implementation.

First of all, you are able to specify Walkthrough behavior the moment SDK initializes:

**Swift:**
```swift
Synerise.initialize(clientApiKey: clientApiKey)
//...
Injector.setAutomatic(true)
Injector.setWalkthroughDelegate(self)
```

Setting `Injector.injectorAutomatic(true)` will fetch Walkthrough right away. Note, that Walkthrough will be presented atop of your current View Controller after application launched.

When you control Walkthrough manually, you can do it when you want and where you want.

To control this behavior please fetch your Walkthrough manually with `Injector.getWalkthrough()`. Also, it must be called after `Injector.setWalkthroughDelegate(self)`.

You can check if Walkthrough is already loaded with `Injector.isWalkthroughLoaded()` method, which returns true if Walkthrough is already loaded.

Moreover, there is an enhanced method to check if Walkthrough is loaded. `Injector.isLoadedWalkthroughUnique()` verifies whether loaded Walkthrough is different than previously presented. Every time any Walkthrough is presented its id is cached locally, therefore you can control your flow more precisely. In summary, the method will return true if loaded Walkthrough is different than previously presented, false otherwise or if Walkthrough is not loaded.

Finally, `Injector.showWalkthrough()` shows Walkthrough if loaded. This method may be called wherever in your application as many times you want. It also returns true if Walkthrough was loaded, false otherwise.

When you choose to load and present Walkthrough manually, you may be interested in a sample implementation of **InjectorWalkthroughDelegate**:

**Swift:**
```swift
// MARK: - InjectorWalkthroughDelegate

// this method will be called when Walkthrough is loaded
func snr_walkthroughDidLoad() {
	if Injector.isWalkthroughLoaded() {
		if Injector.isLoadedWalkthroughUnique() {
			Injector.showWalkthrough()
		}
	}
}

// this method will be called when an error occurs while loading Walkthrough
func snr_walkthroughLoadingError(error: Error) {
	print(error.localizedDescription)
}

// this method will be called when Walkthrough appeared
func snr_walkthroughDidAppear() {
	//...
}

// this method will be called when Walkthrough disappeared
func snr_walkthroughDidDisappear() {
	//...
}
```

**Objective-C:**
```objective-c
#pragma mark - SNRInjectorWalkthroughDelegate

// this method will be called when Walkthrough is loaded
- (void)SNR_walkthroughDidLoad {
	if ([SNRInjector isWalkthroughLoaded]) {
		if ([SNRInjector isLoadedWalkthroughUnique]) {
			[SNRInjector showWalkthrough];
		}
	}
}

// this method will be called when an error occurs while loading Walkthrough
- (void)SNR_walkthroughLoadingError:(NSError*)error {
	//...
}

// this method will be called when Walkthrough appeared
- (void)SNR_walkthroughDidAppear {
	//...
}

// this method will be called when Walkthrough disappeared
- (void)SNR_walkthroughDidDisappear {
	//...
}
```


## Simple push campaign

Simple push is served by simple push notifications. 

Note: You have to configure push notifications before. See sections: **Configure push notifications** and **Handling push notifications** for information.

If an app was not active (closed or in the background) and the campaign came in - push notification is appeared in notification center. When a user clicks the notification, he is moved to the application and simple push is presented.

If an app is active, a simple push is presented right away.

### Payload

```json
{
  "data": {
    "issuer": "Synerise",
    "message-type": "static-content",
    "content-type": "simple-push",
    "content": {
      "notification": {
        "title": "Synerise Simple Push title",
        "body": "Synerise Simple Push message",
        "sound": "default",
        "icon": "http://images.synerise.com/marvellous_image.jpg",
        "priority": "HIGH",
        "action": {
          "item": "https://synerise.com",
          "type": "OPEN_URL"
        }
      },
      "buttons": [
        {
          "identifier": "button_1",
          "action": {
            "item": "https://synerise.com",
            "type": "OPEN_URL"
          },
          "text": "Button 1"
        },
        {
          "identifier": "button_2",
          "action": {
            "item": "syne://product?sku=el-oven",
            "type": "DEEP_LINKING"
          },
          "text": "Button 2"
        }
      ],
      "campaign": {
        "variant_id": 12345,
        "type": "Mobile push",
        "title": "Mobile push test campaign",
        "hash_id": "1893b5be-79c6-4432-xxxx-81e7bd4ea09d"
      }
    }
  }
}
```

Action types are: DEEP_LINKING, OPEN_URL, OPEN_APP.
Priority types are: NORMAL, HIGH.


## Banner campaign

Banners are served by silent push notifications.

Note: You have to configure push notifications before. See sections: **Configure push notifications** and **Handling push notifications** for information.


It is not always suitable for you to show banners which may come. The application may be in a state you do not want banner cannot cover the user's screen.

Fortunately, you can control incoming banners by implementing an optional delegate **InjectorBannerDelegate**:

**Swift:**
```swift
// MARK: - InjectorBannerDelegate

// this method will be called when Synerise SDK asks if it can display a banner at the moment
// bannerDictionary parameter is dictionary representation of banner. If you don't want to show a banner at the moment, you can return false. Then, do it later by calling Injector.showBanner(_: Dictionary, markPresented: Bool) to show banner with provided data.
func snr_shouldBannerAppear(bannerDictionary: Dictionary) -> Bool {
	return true
}

// this method will be called when Banner appeared
func snr_bannerDidAppear() {
	//...
}

// this method will be called when Banner disappeared
func snr_bannerDidDisappear() {
	//...
}
```

**Objective-C:**
```objective-c
#pragma mark - SNRInjectorBannerDelegate

// this method will be called when Synerise SDK asks if it can display a banner at the moment
// bannerDictionary parameter is dictionary representation of banner. If you don't want to show a banner at the moment, you can return NO. Then, do it later by calling [SNRInjector showBanner:(NSDictionary*)bannerDictionary markPresented:(BOOL)markPresented] to show banner with provided data.
- (BOOL)SNR_shouldBannerAppear:(NSDictionary*)bannerDictionary {
    return YES;
}

// this method will be called when Banner appeared
- (void)SNR_bannerDidAppear {
	//...
}

// this method will be called when Banner disappeared
- (void)SNR_bannerDidDisappear {
	//...
}
```

### Payload

```json
{
  "notification": {
    "title": "Notification title if app was invisible",
    "body": "Notification message if app was invisible"
  },
  "data": {
    "issuer": "Synerise",
    "message-type": "dynamic-content",
    "content-type": "template-banner",
    "content": {
      "page": {
        "type": "image_with_text_atop",
        "button": {
          "is_enabled": true,
          "corner_radius": 40,
          "color": "#13e413",
          "text": "Navigate to Synerise",
          "text_color": "#1f74d9"
        },
        "image": {
          "url": "http://images.synerise.com/marvellous_image.jpg"
        },
        "close_button": {
          "is_enabled": true,
          "alignment": "LEFT"
        },
        "background": {
          "color": "#d319d3",
          "alpha": 0.5
        },
        "index": 0,
        "header": {
          "color": "#384350",
          "size": 35,
          "alpha": 1,
          "text": "SYNERISE"
        },
        "description": {
          "color": "#384350",
          "size": 20,
          "alpha": 1,
          "text": "Click below button to open Synerise website"
        },
        "action": {
          "item": "http://synerise.com",
          "type": "OPEN_URL"
        }
      },
      "auto_disappear": {
        "is_enabled": true,
        "timeout": 5
      },
      "campaign": {
        "variant_id": 12345,
        "type": "Mobile banner",
        "title": "Mobile banner test campaign",
        "hash_id": "1893b5be-79c6-4432-xxxx-81e7bd4ea09d"
      }
    }
  }
}
```

Banner types are: color_as_background, image_as_background, image_with_text_atop, image_with_text_below.


### Triggers

In order to show banner immediately after certain event occured, you can send your banners from our panel with a trigger value.

First of all, calling `Injector.fetchBanners(success:failure:)` will fetch available banners and then SDK will cache valid ones. On success closure, you get Array of banners in dictionary representation.

This method is also called during SDK initialization, so use it only when you wish to overwrite current banners in SDK cache. `Injector.getBanners()` provides valid banners right from SDK cache.

**Note**, that exact same banners are being searched for eventual campaign triggers.

You can keep banners data from: 
1. `Injector.fetchBanners(success:failure:)` - fetch available banners (SDK will refresh cache).
2. `Injector.getBanners()` - get available banners from SDK cache.
3. `snr_shouldBannerAppear(bannerDictionary: Dictionary)` - optional delegate method. See **Banner campaign** section above for more information.

Then, call `Injector.showBanner(_: Dictionary)` to show banner immediately. In this case, delegate method `snr_shouldBannerAppear(bannerDictionary: Dictionary)` will not be called. 

**Note**, that banner will appear even though your View Controller implements **SyneriseActivityNotAllowed** protocol. See **Common features** section for more information.


## Common features

### Own implementation (Simple Push, Banner)

You can also react to Synerise push notifications by yourself and that is why we would like to share our Synerise Simple Push and Synerise Banner payload (see corresponding sections above).

You may need to know whether incoming push message comes from Synerise.

`Synerise.isSyneriseNotification(_:)` - checks whether provided push data comes from Synerise. It is validated by checking if incoming push contains "issuer" key with "Synerise" value.

Example:
```swift
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
	let userInfo = notification.request.content.userInfo

	let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		// default implementation by Synerise SDK
		// Synerise.handleNotification(userInfo)
		// or
		// your own implementation
		completionHandler(UNNotificationPresentationOptions.init(rawValue: 0))
	} else {
		//...
	}
}
```

### `SyneriseActivityNotAllowed` protocol

In addition, if there are View Controllers in your application that should never to be covered by Synerise activity (for example banner), you can add **SyneriseActivityNotAllowed** protocol to your class.

For example:

**Swift:**
```swift
class SampleViewController: UIViewController, SyneriseActivityNotAllowed {
	//...
	//...
	//...
}
```

**Objective-C:**
```objective-c
@interface SampleViewController: UIViewController <SNRSyneriseActivityNotAllowed>
//...
//...
//...
@end
```

This is it. When presented View Controller implementing that protocol, Synerise activities are skipped.

### Campaign Pushes information

`Injector.getPushes(success:failure:)` gets all available simple and silent pushes for this client. On success closure, you get Array of push notifications in dictionary representation.



# Author
Synerise, developer@synerise.com. If you need support please feel free to contact us.
