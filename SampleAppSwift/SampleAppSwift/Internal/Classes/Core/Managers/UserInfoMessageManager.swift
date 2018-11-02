//
//  UserInfoMessageManager.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import NotificationBannerSwift

class UserInfoMessageManager {
    
    enum MessageType {
        case info
        case success
        case error
    }
    
    static let shared = UserInfoMessageManager()
    
    var fakeSubtitleLabelEnabled: Bool
    
    private var defaultQueue: NotificationBannerQueue = NotificationBannerQueue()

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
            self.defaultQueue.removeAll()
            
            var style: BannerStyle!
            
            switch type {
            case .info:
                style = BannerStyle.info
            case .success:
                style = BannerStyle.success
            case .error:
                style = BannerStyle.danger
            }
            
            let banner = NotificationBanner(title: title, subtitle: message, leftView: nil, rightView: nil, style: style, colors: nil)
            
            banner.titleLabel?.textAlignment = .center
            banner.subtitleLabel?.textAlignment = .center
            
            banner.duration = 2
            banner.dismissOnTap = true
            banner.dismissOnSwipeUp = true
            
            if self.fakeSubtitleLabelEnabled {
                if let bannerText = message, let bannerFont = banner.subtitleLabel?.font {
                    let fakeSubtitleLabel = UILabel(frame: CGRect.zero)
                    fakeSubtitleLabel.font = UIFont(name: bannerFont.fontName, size: bannerFont.pointSize)
                    fakeSubtitleLabel.numberOfLines = 0
                    fakeSubtitleLabel.textColor = banner.subtitleLabel?.textColor
                    fakeSubtitleLabel.textAlignment = .center
                    fakeSubtitleLabel.text = bannerText
                    
                    banner.subtitleLabel?.isHidden = true
                    banner.subtitleLabel?.superview?.addSubview(fakeSubtitleLabel)
                    
                    fakeSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
                    fakeSubtitleLabel.topAnchor.constraint(equalTo: banner.subtitleLabel!.topAnchor, constant: 2.5).isActive = true
                    fakeSubtitleLabel.leftAnchor.constraint(equalTo: banner.leftAnchor, constant: 15).isActive = true
                    fakeSubtitleLabel.rightAnchor.constraint(equalTo: banner.rightAnchor, constant: -15).isActive = true
                    fakeSubtitleLabel.bottomAnchor.constraint(equalTo: banner.subtitleLabel!.superview!.bottomAnchor, constant: 0).isActive = true
                    
                    let deviceWidth = UIScreen.main.bounds.size.width
                    
                    let bannerPadding = (2 * 10) as CGFloat
                    let bannerTitleHeight = 21.0 as CGFloat
                    let bannerLabelsSpacing = 2.5 as CGFloat
                    let bannerSubtitleSize = fakeSubtitleLabel.sizeThatFits(CGSize(width: deviceWidth - (2 * 15), height: CGFloat(MAXFLOAT)))
                    let bannerSubtitleHeight = min((20 * 18.0), bannerSubtitleSize.height)
                    
                    fakeSubtitleLabel.heightAnchor.constraint(equalToConstant: bannerSubtitleHeight).isActive = true
                    
                    banner.bannerHeight = bannerPadding + bannerLabelsSpacing + bannerTitleHeight + bannerSubtitleHeight
                }
            }
 
            banner.show(bannerPosition: .bottom, queue: self.defaultQueue)
        }
    }
}
