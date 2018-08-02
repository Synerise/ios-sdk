# Synerise iOS SDK (v3.2.17)

[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://github.com/synerise/ios-sdk)
[![Languages](https://img.shields.io/badge/language-Objective--C%20%7C%20Swift-orange.svg)](https://github.com/synerise/ios-sdk)
[![CocoaPods](https://img.shields.io/badge/pod-v3.2.17-green.svg)](https://cocoapods.org/pods/SyneriseSDK)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/Synerise/ios-sdk/blob/master/LICENSE)

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate SyneriseSDK software into your apps. For more info about Synerise visit the [Synerise Website](http://synerise.com).



# Requirements

* Xcode 9 and iOS SDK 11
* iOS 9.0+ target deployment
* Valid architectures: armv7, armv7s, arm64 devices and i386, x86_64 simulators



# Installation

## Install SyneriseSDK from CocoaPods

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


## Install SyneriseSDK from Carthage

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


## Dependencies

SyneriseSDK requires Firebase with Messaging service so you have to import these dependencies for CocoaPods or Carthage.

Note: more about Firebase configuration - [get started with Firebase iOS](https://firebase.google.com/docs/storage/ios/start).



# Configuration

1. Under your application targets "Build Settings" configuration find the "Other Linker Flags" property and set it to "-ObjC".
2. In your application plist file (often called "Info.plist") add a row for "Required background modes" of type Array. It then needs: "App downloads content in response to push notifications".
3. If you are going to use http addresses (instead only https), you will need to change whitelist domains in your app by adding the following to your application's plist (often called "Info.plist"):

```
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

4. You will need to import the SyneriseSDK header into the files that contain code relating to SyneriseSDK. 

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

First of all, you need to initialize Synerise iOS SDK in your AppDelegate and provide `Business API Key` with `Client API Key`.

To get `Business API Key` and  `Client API Key`, please sign in to your Synerise account and visit [https://app.synerise.com/api](https://app.synerise.com/api).
Then, generate new `API Key` for `Business Profile` audience and new `API Key` for `Client` audience.

Configuration for SyneriseSDK should be completely resolved before the end of `AppDelegate` `didFinishLaunchingWithOptions` method.

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	let businessProfileApiKey = "YOUR_BUSINESS_API_KEY"
	let clientApiKey = "YOUR_CLIENT_API_KEY"

	Synerise.initialize(businessProfileApiKey: businessProfileApiKey, clientApiKey: clientApiKey) // 1
	Synerise.setDelegate(self) // 2

	Tracker.setLoggingEnabled(true) // 3
	Tracker.setAutoTrackMode(.fine) // 4

	let trackerConfiguration = TrackerConfiguration();
	trackerConfiguration.minBathSize = 10;
	trackerConfiguration.maxBathSize = 100;
	trackerConfiguration.autoFlushTimeout = 10.0;

	Tracker.setConfiguration(trackerConfiguration); // 5

	Client.setLoggingEnabled(true) // 6

	let clientConfiguration = ClientConfiguration();
	clientConfiguration.autoClientRefresh = true;

	Client.setConfiguration(clientConfiguration); // 7

	Profile.setLoggingEnabled(true) // 8
	Profile.setPoolUuid("YOUR_POOL_UUID"); // 9

	Injector.setLoggingEnabled(true) // 10
	Injector.setAutomatic(true) // 11
	Injector.setWalkthroughDelegate(self) // 12
	Injector.setBannerDelegate(self) // 13
}
```

**Objective-C:**
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	static NSString *businessProfileApiKey = @"YOUR_BUSINESS_API_KEY";
	static NSString *clientApiKey = @"YOUR_CLIENT_API_KEY";

	[SNRSynerise initializeWithBusinessProfileApiKey:businessProfileApiKey andClientApiKey:clientApiKey]; // 1
	[SNRSynerise setDelegate:self]; // 2
	
	[SNRTracker setLoggingEnabled:YES]; // 3
	[SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine]; // 4

	SNRTrackerConfiguration trackerConfiguration;
	trackerConfiguration.minBathSize = 10;
	trackerConfiguration.maxBathSize = 100;
	trackerConfiguration.autoFlushTimeout = 10.0f;
	
	[SNRTracker setConfiguration:trackerConfiguration]; // 5

	[SNRClient setLoggingEnabled:YES]; // 6

	SNRClientConfiguration clientConfiguration;
	clientConfiguration.autoClientRefresh = YES;
	
	[SNRClient setConfiguration:clientConfiguration]; // 7

	[SNRProfile setLoggingEnabled:YES]; // 8
	[SNRProfile setPoolUuid:@"YOUR_POOL_UUID"]; // 9

	[SNRInjector setLoggingEnabled:YES]; // 10
	[SNRInjector setAutomatic:YES]; // 11
	[SNRInjector setWalkthroughDelegate:self]; // 12
	[SNRInjector setBannerDelegate:self]; // 13
}
```

Let's dive into some configurable functionalities:
1. `Synerise.initialize` - Initializes SyneriseSDK.
2. `Synerise.setDelegate` - Sets delegate to handle actions from SyneriseSDK. See **SyneriseSDK delegate** section for more information.
3. `Tracker.setLoggingEnabled` - Enables logs for Tracker module. See **Debug logs** section for more information.
4. `Tracker.setAutoTrackMode` - Sets proper mode for view tracking. See **Tracker** section for more information.
5. `Tracker.setConfiguration` - Sets custom configuration for Tracker module.
6. `Client.setLoggingEnabled` - Enables logs for Tracker module. See **Debug logs** section for more information.
7. `Client.setConfiguration` - Sets custom configuration for Client module.
8. `Profile.setLoggingEnabled` - Enables logs for Profile module. See **Debug logs** section for more information.
9. `Profile.setPoolUuid` - Sets your pool's universally unique identifier. See **Profile** section for more information.
10. `Injector.setLoggingEnabled` - Enables logs for Injector module. See **Debug logs** section for more information.
11. `Injector.setAutomatic` - Fetches your Injector content right away. See **Injector** section for more information.
12. `Injector.setWalkthroughDelegate` - Sets delegate to handle walkthrough actions. See **Injector** section for more information.
13. `Injector.setBannerDelegate` - Sets delegate to handle banner actions. See **Injector** section for more information.

## Setup with custom API environment

There is option to change API baseURL for on-premise installations.  

One thing you have to do for that is using different initialization method:

**Swift:**
```swift
let businessProfileApiKey = "YOUR_BUSINESS_API_KEY"
let clientApiKey = "YOUR_CLIENT_API_KEY"
let apiBaseUrl = "YOUR_API_BASE_URL"

Synerise.initialize(businessProfileApiKey: businessProfileApiKey, clientApiKey: clientApiKey, baseUrl: apiBaseUrl)
```

**Objective-C:**
```objective-c
static NSString *businessProfileApiKey = @"YOUR_BUSINESS_API_KEY";
static NSString *clientApiKey = @"YOUR_CLIENT_API_KEY";
static NSString *apiBaseUrl = @"YOUR_API_BASE_URL";

[SNRSynerise initializeWithBusinessProfileApiKey:businessProfileApiKey andClientApiKey:clientApiKey andBaseUrl:apiBaseUrl];
```


## Debug logs

You can enable debug logs for SyneriseSDK modules, such as Tracker, Client, Profile and Injector.
It is not recommended to use debug mode in a release version of your app.

- Tracker: you can receive some simple logs about sending events (like success, failure etc.) by enabling debug mode, which is disabled by default.
- Profile: you can receive some simple logs about profile actions (like registration etc.) by enabling debug mode, which is disabled by default.
- Client: you can receive some simple logs about client actions (like login etc.) by enabling debug mode, which is disabled by default.
- Injector: you can receive some simple logs about Injector actions (like walkthrough or welcome screen availability) by enabling debug mode, which is disabled by default.

It can be enabled by method `setLoggingEnabled` for each module. For example:

**Swift:**
```swift
Tracker.setLoggingEnabled(true)
```

**Objective-C:**
```objective-c
[SNRTracker setLoggingEnabled(YES];
```


## SyneriseSDK delegate

You can specify your custom action when a user clicks on simple push, banner or walkthrough.
SyneriseSDK implements two main actions that user may invoke - open URL and Deeplink.

There is one more method when SyneriseSDK needs re-registration for push notifications.

**Swift:**
```swift
//MARK: SyneriseDelegate
    
//optional method - SyneriseSDK needs registration for push notifications again
//it is optional but if you use push notifications, it is required
//propable implementation
func snr_registerForPushNotificationsIsNeeded() {
	if let fcmToken: String = Messaging.messaging().fcmToken {
		Profile.registerForPush(registrationToken: fcmToken, success: { (success) in
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

//optional method - SyneriseSDK needs registration for push notifications again
//it is optional but if you use push notifications, it is required
//propable implementation
- (void)SNR_registerForPushNotificationsIsNeeded {
	NSString *fcmToken = [FIRMessaging messaging].FCMToken;
	if (fcmToken) {
		[SNRProfile registerForPush:fcmToken success:^(BOOL isSuccess) {
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


## Configure push notifications

When you want to use the full functionality of SyneriseSDK, you have to configure Push Notifications. It works with help Firebase Messaging service. 

Following steps must be done:
1. Start Firebase service.
2. Set Firebase Messaging delegate.
3. Register for Apple Push Notifications.
4. Implement Firebase Messaging service.
5. Invoke SyneriseSDK method for push registration and pass FCM Token.

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

//MARK: MessagingDelegate

func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
	Profile.registerForPush(registrationToken: fcmToken, success: { (success) in
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
	[SNRProfile registerForPush:fcmToken success:^(BOOL isSuccess) {
		//...
	} failure:^(NSError * _Nonnull error) {
		//...
	}];
}
```


## Handling push notifications

In order to display push message and banners properly, you have to pass incoming push notification payload to SyneriseSDK in your AppDelegate:

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
// MARK: UNUserNotificationCenterDelegate

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


# Exceptions/Errors handling

SyneriseSDK throws exceptions in some method when provided data is not valid. For example, framework checks if an email address is valid and throws an exception if not. That is why we should wrap some operations in SyneriseSDK in try/catch blocks. Example of client logging below.

### Example of exceptions/errros handling in Objective-C and Swift:

**Swift:**
```swift
private func loginWithPhone(phone: String, password: String) {
    do {
        try SNRExceptionHandler.catchException {
            Client.login(phone: phone, password: password, deviceId: nil, success: { (success) in
            	//...
            }, failure: { (error) in
            	//...
            })
        }
    } catch let error as NSError {
        if error is SNRInvalidPhoneNumberError {
            //...
        } else if error is SNRInvalidPasswordError {
        	//...
        }
    } catch {
        //...
    }
}
```

**Objective-C:**
```objective-c
- (void)loginClientByPhone {
    @try {
        NSString *phone = @"123456789";
        NSString *password = @"pass!1test";
        [SNRClient logInWithPhone:phone password:password deviceId:nil success:^(BOOL isSuccess) {
        	//...
        } failure:^(NSError * _Nonnull error) {
        	//...
        }];
    }
    @catch (SNRInvalidPhoneNumberException *exception) {
    	//...
    }
    @catch (SNRInvalidPasswordException *exception) {
		//...
    }
    @finally {}
}
```

### Objective-C exceptions and their errors in swift:

**SNRInvalidEmailException** - **SNRInvalidEmailError**

**SNRInvalidPasswordException** - **SNRInvalidPasswordError**

**SNRInvalidPhoneNumberException** - **SNRInvalidPhoneNumberError**

**SNRInvalidBirthdateException** - **SNRInvalidBirthdateError**


# Tracker

Synerise SDK provides you with powerful features for User Activity Tracking that you can use within your mobile application.

## Tracker Configuration

**Swift:**
```swift
var trackerConfiguration: TrackerConfiguration = TrackerConfiguration();
trackerConfiguration.minBathSize = 1;
trackerConfiguration.maxBathSize = 100;
trackerConfiguration.autoFlushTimeout = 2.0;
    
[Tracker setConfiguration:trackerConfiguration];
```

**Objective-C:**
```objective-c
SNRTrackerConfiguration trackerConfiguration;
trackerConfiguration.minBathSize = 1;
trackerConfiguration.maxBathSize = 100;
trackerConfiguration.autoFlushTimeout = 2.0f;
    
[SNRTracker setConfiguration:trackerConfiguration];
```

**MIN BATH SIZE** - This parameter sets a minimum number of events in queue required to send them.

**MAX BATH SIZE** - This parameter sets a maximum number of events, which may be sent in a single batch.

**AUTO FLUSH TIMEOUT** - This parameter sets the time required to elapse before event's queue will attempt to be sent.


## View tracking

Auto-tracking is functionality available in SyneriseSDK that can attach to nearly everything within your application and log events automatically that you can then make use of within Synerise.

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

### - Session Events
Group of events related to user's session.

#### LoggedInEvent
Record a 'client logged in' event.

#### LoggedOutEvent
Record a 'client logged out' event.

#### RegisteredEvent
Record a 'client registered' event.

### - Products Events
Group of events related to products and cart.

#### AddedProductToFavoritesEvent
Record a 'client added product to favorites' event.

#### AddedProductToCartEvent
Record a 'client added product to cart' event.

#### RemovedProductFromCartEvent
Record a 'client removed product from cart' event.

### - Transaction Events
Group of events related to user's transactions.

#### CancelledTransactionEvent
Record a 'client cancelled transaction' event.

#### CompletedTransactionEvent
Record a 'client completed transaction' event.

### - Other Events
Group of uncategorized events related to user's location and actions.

#### AppearedInLocationEvent
Record a 'client appeared in location' event.

#### HitTimerEvent
Record a 'client hit timer' event. This could be used for profiling or activity time monitoring - you can send "hit timer" when your client starts doing something and send it once again when finishes, but this time with the different time signature. Then you can use our analytics engine to measure e.g. average activity time.

#### SearchedEvent
Record a 'client searched' event.

#### SharedEvent
Record a 'client shared' event.

#### VisitedScreenEvent
Record a 'client visited screen' event.

#### CustomEvent
This is the only event which requires `action` field.


## Other features

#### `Tracker.flushEvents()` and `Tracker.flushEvents(completionHandler:)`
Flush method forces sending events from queue to server.

#### `Tracker.setCustomIdentifier(customIdentifier)`
Sets your custom identifier that will be sent within every event in event params.

#### `Tracker.setCustomEmail(customEmail)`
Sets your custom email that will be sent within every event in event params.


# Client

## Client Configuration

**Swift:**
```swift
var clientConfiguration: ClientConfiguration = ClientConfiguration();
clientConfiguration.autoClientRefresh = true;
    
[Client setConfiguration:clientConfiguration];
```

**Objective-C:**
```objective-c
SNRClientConfiguration clientConfiguration;
clientConfiguration.autoClientRefresh = YES;
    
[SNRClient setConfiguration:clientConfiguration];
```

**AUTO CLIENT REFRESH** - Enables automatic client's token refresh.


## Features

#### `Client.login(email:password:deviceId:success:)`
Sign in a client in order to obtain the JWT token, which could be used in subsequent requests.<br>
The token is currently valid for 1 hour and SDK will refresh token before each call if it is expiring (but not expired).<br>
The method requires valid and non-null email and password. The device ID is optional.<br>

#### `Client.login(phone:password:deviceId:success:)`
Sign in a client in order to obtain the JWT token, which could be used in subsequent requests.<br>
The token is currently valid for 1 hour and SDK will refresh token before each call if it is expiring (but not expired).<br>
The method requires valid and non-null email and password. The device ID is optional.<br>

#### `Client.logOut()`
Signing client out causes in generating new UUID for a new anonymous one.

#### `Client.getAccount(success:failure:)`
Use this method to get client's account information.<br>
This method pass `SNRClientAccountInformation` with success block execution.

#### `Client.updateAccount(success:failure:)`
Use this method to update client's account information.<br>
This method pass `SNRClientUpdateAccountContext` with success block execution.

#### `Client.getToken(success:failure:)`
Get valid JWT login token.<br>
This method pass token with success block execution.

#### `Client.getUUID()`
Retrieve current client's UUID.<br>

#### `Client.isSignedIn()`
Retrieve whether client is signed in (is client's token not expired).<br>

#### `Client.getAnalytics(success:failure:)`
Get all available Analytics metrics for the client.<br>

#### `Client.getAnalytics(name:success:failure:)`
Fetch all available Analytics metrics for the client and return the first metric, which matches provided name<br>

Note, that some methods can throw exceptions from validation, for example, if you pass invalid email for `Client.login(email:password:deviceId:success:)`. Use try/catch in some operations (see Exceptions/Errors handling section).


# Profile

## Features

#### `Profile.setPoolUuid(_ )`
Provide your pool's universally unique identifier to assign available voucher to the customer right before registration.<br>

#### `Profile.getClient(success:failure:)`
Get client profile information with email.

#### `Profile.createClient(success:failure:)`
Create a new client record if no identifier has been assigned for him before in Synerise.
This method requires `CreateClientContext`

#### `Profile.registerClient(success:failure:)`
Register new Client with email or phone (depending on context model), password and optional data.
This method requires `RegisterClientContext`

#### `Profile.confirmAccount(phone:confirmationCode:success:failure:)`
Confirm client's account with confirmation code received by phone.

#### `Profile.updateClient(context:success:failure:)`
Update client with ID and optional data.
This method requires `UpdateClientContext`

#### `Profile.deleteClient(success:failure:)`
Delete client with ID.
This method requires client's id.

#### `Profile.resetPassword(success:failure:)`
Request client's password reset with email. Client will receive a token on provided email address in order to use Profile.confirmResetPassword(password, token).
This method requires `ClientPasswordResetRequestContext`

#### `Profile.confirmResetPassword(success:failure:)`
Confirm client's password reset with new password and token provided by Profile.requestPasswordReset(email).
This method requires `ClientPasswordResetConfirmationContext`

#### `Profile.getToken(success:failure:)` 
Get valid JWT login token.
This method pass token with success block execution.

Note, that some methods can throw exceptions from validation, for example, if you pass invalid email for `Profile.getClient:success:failure:`. Use try/catch in some operations (see Exceptions/Errors handling section).


# Injector

Injector is designed to be simple to develop with, allowing you to integrate Synerise Mobile Content into your apps easily.

## Walkthrough

Synerise SDK provides multiple functionalities within Walkthrough implementation.

First of all, you are able to specify Walkthrough behavior the moment SDK initializes:

**Swift:**
```swift
Synerise.initialize(businessProfileApiKey: businessProfileApiKey, clientApiKey: clientApiKey)
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
//MARK: InjectorWalkthroughDelegate

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


## Banner campaign

Banners are served by silent push notifications.

Note: You have to configure push notifications before. See sections: **Configure push notifications** and **Handling push notifications** for information.


It is not always suitable for you to show banners which may come. The application may be in a state you do not want banner cannot cover the user's screen.

Fortunately, you can control incoming banners by implementing an optional delegate **InjectorBannerDelegate**:

**Swift:**
```swift
//MARK: InjectorBannerDelegate

// this method will be called when SyneriseSDK asks if it can display a banner at the moment
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

// this method will be called when SyneriseSDK asks if it can display a banner at the moment
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

### Analytics Metrics

`Client.getAnalytics(success:failure:)`, `Client.getAnalytics(name:success:failure:)` - method to retrieve analytical metrics from Synerise backend.


# Author
Synerise, developer@synerise.com. If you need support please feel free to contact us.