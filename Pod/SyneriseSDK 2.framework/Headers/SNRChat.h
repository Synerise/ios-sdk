//
//  SNRChat.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

@class SNRChat;

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRChatCloseButtonHorizontalAlignment
 */

typedef NS_ENUM(NSInteger, SNRChatCloseButtonHorizontalAlignment) {
    SNRChatCloseButtonHorizontalAlignmentLeft,
    SNRChatCloseButtonHorizontalAlignmentRight
} NS_SWIFT_NAME(ChatCloseButtonHorizontalAlignment);


/**
 * @protocol SNRChatDelegate
 */

NS_SWIFT_NAME(ChatDelegate)
@protocol SNRChatDelegate

@optional

/**
 * This method is called after chat is loaded.
 */
- (void)SNR_chatDidLoad NS_SWIFT_NAME(snr_chatDidLoad());

/**
 * This method is called when an error occurs while loading.
 */
- (void)SNR_chatDidNotLoadWithError:(NSError *)error NS_SWIFT_NAME(snr_chatDidNotLoad(error:));

/**
 * This method is called when the widget’s loading state changes.
 */
- (void)SNR_chatIsLoading:(BOOL)isLoading NS_SWIFT_NAME(snr_chatIsLoading(isLoading:));

@end


/**
 * @class SNRChat
 */

NS_SWIFT_NAME(Chat)
@interface SNRChat : NSObject

@property (weak, nonatomic, nullable, readwrite) id<SNRChatDelegate> delegate;

@property (copy, nonatomic, nonnull, readwrite) UIColor *navigationBarBackgroundColor;
@property (copy, nonatomic, nonnull, readwrite) UIColor *navigationBarTitleColor;
@property (copy, nonatomic, nonnull, readwrite) NSString *navigationBarTitle;

@property (assign, nonatomic, readwrite) SNRChatCloseButtonHorizontalAlignment closeButtonHorizontalAlignment;
@property (copy, nonatomic, nonnull, readwrite) UIColor *closeButtonTintColor;
@property (copy, nonatomic, nonnull, readwrite) NSString *closeButtonText;
@property (copy, nonatomic, nullable, readwrite) UIImage *closeButtonImage;

@property (copy, nonatomic, nonnull, readwrite) NSString *errorText;
@property (copy, nonatomic, nonnull, readwrite) UIColor *errorTextColor;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithTrackerKey:(NSString *)trackerKey;

- (void)load;
- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END
