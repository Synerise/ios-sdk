//
//  UserInfoMessageManager.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SwiftMessages

class UserInfoMessageManager {
    
    enum MessageType {
        case info
        case success
        case error
    }
    
    static let shared = UserInfoMessageManager()
    
    var fakeSubtitleLabelEnabled: Bool
    
    //private var defaultQueue: NotificationBannerQueue = NotificationBannerQueue()

    // MARK: - Init
    
    private init() {
        self.fakeSubtitleLabelEnabled = true
    }
    
    // MARK: - Public
    
    func info(_ title: String, _ message: String?) {
        showNotificationBanner(title: title, message: message, type: .info)
    }
    
    func success(_ title: String, _ message: String?) {
        showNotificationBanner(title: title, message: message, type: .success)
    }
    
    func error(_ title: String, _ message: String?) {
        showNotificationBanner(title: title, message: message, type: .error)
    }
    
    // MARK: - Private
    
    private func showNotificationBanner(title: String, message: String?, type: MessageType) {
        DispatchQueue.main.async {
            SwiftMessages.hideAll()
            
            var config = SwiftMessages.Config()
            config.presentationContext = .window(windowLevel: .statusBar)
            config.presentationStyle = .bottom
            config.duration = .seconds(seconds: 2)
            
            let messageView = MessageView.viewFromNib(layout: .centeredView)
            
            switch type {
            case .info:
                messageView.configureTheme(.info)
            case .success:
                messageView.configureTheme(.success)
            case .error:
                messageView.configureTheme(.error)
            }
            
            messageView.configureDropShadow()
            messageView.layoutMarginAdditions = UIEdgeInsets.zero
            (messageView.backgroundView as? CornerRoundingView)?.cornerRadius = 0
            messageView.iconImageView?.isHidden = true
            messageView.iconLabel?.isHidden = true
            messageView.titleLabel?.text = title
            messageView.bodyLabel?.text = message
            messageView.button?.isHidden = true
            
            SwiftMessages.show(config: config, view: messageView)
        }
    }
}
