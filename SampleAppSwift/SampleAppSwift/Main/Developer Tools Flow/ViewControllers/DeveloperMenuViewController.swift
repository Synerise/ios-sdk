//
//  DeveloperMenuViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK
import Crashlytics

protocol DeveloperMenuViewControllerDelegate: class {
    func resetApplicationWasPressed(_ developerMenuViewController: DeveloperMenuViewController)
}

class DeveloperMenuViewController: DefaultViewController {
    
    weak var delegate: DeveloperMenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_DEVELOPER_MENU_TITLE".localized()
        
        prepareLeftMenuButton()
        prepareBackButton()
    }
    
    @IBAction func showChat() {
        let chat = Chat()
        chat.trackerKey = ""
        chat.navigationBarBackgroundColor = UIColor.gray
        chat.navigationBarTitle = "Chat"
        chat.navigationBarTitleColor = UIColor.white
        chat.closeButtonHorizontalAlignment = .left
        chat.closeButtonImage = UIImage(named: "icon_close_black_small")!
        chat.closeButtonTintColor = UIColor.lightGray
        chat.load()
        chat.show()
    }
    
    @IBAction func resetApplication() {
        delegate?.resetApplicationWasPressed(self)
        Crashlytics.sharedInstance().crash()
    }
    
    @IBAction func synerise1() {
        let clientApiKey: String = Configuration.SyneriseSDK.clientAPIKey1
        
        showLoading()
        Synerise.changeClientApiKey(clientApiKey)
        
        let settingsService = ServiceProvider.resolve().getSettingsService()
        settingsService.set(clientApiKey, forKey: SettingsServiceKey.syneriseClientAPIKey)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideLoading()
            self.showSuccessInfo("Current Synerise SDK profile", text: "Synerise Mobile Apps 1", debug: false)
        }
    }
    
    @IBAction func synerise2() {
        let clientApiKey: String = Configuration.SyneriseSDK.clientAPIKey2
        
        showLoading()
        Synerise.changeClientApiKey(clientApiKey)
        
        let settingsService = ServiceProvider.resolve().getSettingsService()
        settingsService.set(clientApiKey, forKey: SettingsServiceKey.syneriseClientAPIKey)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideLoading()
            self.showSuccessInfo("Current Synerise SDK profile", text: "Synerise Mobile Apps 2", debug: false)
        }
    }
}

extension DeveloperMenuViewController: ChatDelegate {
    func snr_chatIsLoading(isLoading: Bool) {

    }

    func snr_chatDidLoad() {

    }

    func snr_chatDidNotLoad(error: Error) {

    }
}
