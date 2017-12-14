# SyneriseSDK

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate SyneriseSDK software into your apps.

For more info about Synerise visit the [Synerise Website](http://synerise.com)

## Requirements

- iOS 9.0+
- Xcode 9.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate  into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
pod 'SyneriseSDK', :git => 'https://github.com/Synerise/ios-sdk.git', :branch => 'v3.0.0'
```

Then, run the following command:

```bash
$ pod install
```

### Configuration

Under your application targets "Build Settings" configuration find the *Other Linker Flags* property and set it to `-ObjC`.

### Integration

Objective-C:
```Objective-C
#import "<SyneriseSDK/SyneriseSDK.h>"
```

Swift:
```Swift
import SyneriseSDK
```

## Setup SyneriseSDK

If you haven't done so already, login to Synerise to get your Synerise API Key(s).

To get `Api Key` sign in to your Synerise account and go to https://app.synerise.com/api/.
There you can generate API Keys for `Business Profile` and `Client`.

Then you have to initialize SyneriseSDK in `application:didFinishLaunchingWithOptions:` method in `AppDelegate`:

```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Initialize SNRTracker
    [SNRTracker initialize:@"<your Business Profile API key>"];

    // Initialize SNRProfile
    [SNRProfile initialize:@"<your Business Profile API key>"];

    // Initialize SNRClient module
    [SNRClient initialize:@"<your Client API key>"];

    return YES;
}
```

## Event Tracker

You can log events from your mobile app to Synerise platform with SNRTracker class. You need to initialize SNRTracker with `[SNRTracker initialize:@"<your Business Profile API key>"];`. Initialize method can be called only once during whole application lifecycle.

### Sending events

To send Event simply use `SNRTracker` method
```Objective-C
[SNRTracker send: [[SNRCustomEvent alloc] initWithLabel:@"customLabel" action:@"customAction"]];
```

You can also pass your custom parameters:
```Objective-C
SNRTrackerParams *params = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder * _Nonnull builder) {
    [builder setDouble:1.023 forKey:@"someKey"];
    [builder setObject:@[@{@"someKey":@"someValue"}] forKey:@"anotherKey"];
    [builder setString:@"String" forKey:@"importantString"];
    [builder setInt:42 forKey:@"answer"];
}];

[SNRTracker send: [[SNRCustomEvent alloc] initWithLabel:@"customLabel" action:@"customAction" andParams:params];
```

### Logging

This method enables/disables console logs from `SNRTracker`. It is not recommended to use debug mode in release version of your application.

```Objective-C
[SNRTracker setLoggingEnabled:YES]; // enables logging
```
## Events ###

### Session Events ###
Group of events related to user's session.

#### LoggedInEvent ####
Record a 'client logged in' event.

#### LoggedOutEvent ####
Record a 'client logged out' event.

### Products Events ###
Group of events related to products and cart.

#### AddedToFavoritesEvent ####
Record a 'client added product to favorites' event.

#### AddedToCartEvent ####
Record a 'client added product to cart' event.

#### RemovedFromCartEvent ####
Record a 'client removed product from cart' event.

### Transaction Events ###
Group of events related to user's transactions.

#### CancelledTransactionEvent ####
Record a 'client cancelled transaction' event.

#### CompletedTransactionEvent ####
Record a 'client completed transaction' event.


### Other Events ###
Group of uncategorized events related to user's location and actions.

#### AppearedInLocationEvent ####
Record a 'client appeared in location' event.

#### HitTimerEvent ###
Record a 'client hit timer' event. This could be used for profiling or activity time monitoring - you can send "hit timer" when your client starts doing something and send it once again when finishes, but this time with different time signature. Then you can use our analytics engine to measure e.g. average activity time.

#### SearchedEvent ###
Record a 'client searched' event.

#### SharedEvent ###
Record a 'client shared' event.

#### VisitedScreenEvent ###
Record a 'client visited screen' event.


### Custom Event ###
This is the only event which requires `action` field. Log your custom data with TrackerParams class.

## Client
`SNRClient` module is responsible for integrating with Synerise Client API. You need to initialize SNRClient with `[SNRClient initialize:@"<your Client API key>"];`. Initialize method can be called only once during whole application lifecycle.

### Login ###
Log in a client in order to obtain the JWT token, which could be used in subsequent requests. The token is valid for 1 hour. This SDK will refresh token before each call if it is expiring (but not expired).
Method requires valid and non-null email and password. DeviceID is optional. // todo: what is deviceId
```Objective-C
[SNRClient logIn:login password:password deviceId:nil 
	success:^(BOOL isSuccess) {
		// successfully logged in
	} failure:^(NSError * _Nonnull error) {
		// error occured
	}];
```

### Get Account ###
Use this method to get client's account information.
```Objective-C
[SNRClient getAccountWithSuccess:^(SNRClientAccountInformation * _Nonnull information) {
	// successfully retrieved account information
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Update Account ###
Use this method to update client's account information. Not provided fields are not modified.

This methods requires `SNRClientUpdateAccountContext` object which is initialized as follows:
```Objective-C
SNRClientUpdateAccountContext *context = [SNRClientUpdateAccountContext new];
context.firstName = @"firstname";
context.lastName = @"lastname";
context.city = @"newCity";
```
Execute account update:
```Objective-C
[SNRClient updateAccount:context success:^(BOOL isSuccess) {
	// successfully updated client account
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Logout
Logs out client
```Objective-C
[SNRClient logOut];
```

### Logging ###
This method enables/disables console logs from `SNRClient`. It is not recommended to use debug mode in release version of your application.
```Objective-C
[SNRClient setLoggingEnabled:YES] // enables logging
```

## Profile
`SNRProfile` module is responsible for integrating with Synerise Profile API. You need to initialize SNRProfile with `[SNRClient initialize:@"<your Business Profile API key>"];`. Initialize method can be called only once during whole application lifecycle.

### Create client ###
Create a new client record if no Synerise identifier has been assigned for him before. Not provided fields are not modified.
```Objective-C
SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
agreements.rfid = NO;
agreements.push = YES;

SNRCreateClientContext *context = [[SNRCreateClientContext alloc] init];
context.email = @"test.email@example.com";
context.agreements = agreements;
context.sex = [SNRClientSex male];
```
Execute client creation:
```Objective-C
[SNRProfile createClient:context success:^(BOOL isSuccess) {
	// successfully created client
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Register client ###
Register new Client with email, password and optional data. Not provided fields are not modified.
```Objective-C
SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
agreements.rfid = NO;
agreements.push = YES;

SNRRegisterClientContext *context = [[SNRRegisterClientContext alloc] init:@"test.email2@example.com" password:@"testPass1!"];
context.agreements = agreements;
context.sex = [SNRClientSex male];
```
Execute client registration:
```Objective-C
[SNRProfile registerClient:context success:^(BOOL isSuccess) {
	// successfully registered client
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Update client ###
Update client with provided ID and optional data.
```Objective-C
SNRUpdateClientContext *context = [[SNRUpdateClientContext alloc] init];
context.firstName = @"newName";
```
Execute client update:
```Objective-C
    [SNRProfile updateClient:10 context:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
```

### Delete client ###
Delete client with provided ID.
```Objective-C
[SNRProfile deleteClient:1000 success:^(BOOL isSuccess) {
    // successfully deleted client
} failure:^(NSError * _Nonnull error) {
    // error occured
}];
```

### Request password reset ###
Request client's password reset with email. Client will receive a token on a provided email address in order to use `[SNRProfile confirmResetPassword:success:failure]` method.
```Objective-C
SNRClientPasswordResetRequestContext *context = [[SNRClientPasswordResetRequestContext alloc] init:@"test.email@example.com"];

[SNRProfile resetPassword:context success:^(BOOL isSuccess) {
	// successfully sent password reset request
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Confirm password reset ###
Confirm client's password reset with new password and token provided sent in an e-mail sent by calling `[SNRProfile resetPassword:success:failure]` method;
```Objective-C
SNRClientPasswordResetConfirmationContext *context = [[SNRClientPasswordResetConfirmationContext alloc] init:@"testPassword1!" token:@"token"];

[SNRProfile confirmResetPassword:context success:^(BOOL isSuccess) {
	// successfully reset password
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Logging ###
This method enables/disables console logs from `SNRProfile`. It is not recommended to use debug mode in release version of your application.
```Objective-C
[SNRProfile setLoggingEnabled:YES] // enables logging
```

## Author

Synerise, developer@synerise.com. If you need support please feel free and contact us.

## License

InjectorSDK is available under the MIT license. See the LICENSE file for more info.