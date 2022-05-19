//
//  DeveloperMenuViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK
import Firebase

protocol DeveloperMenuViewControllerDelegate: class {
    func resetApplicationWasPressed(_ developerMenuViewController: DeveloperMenuViewController)
}

class DeveloperMenuViewController: DefaultViewController {
    
    weak var delegate: DeveloperMenuViewControllerDelegate?
    
    @IBOutlet weak var developerMenuStackView: UIStackView!
    
    // MARK: - IBAction
    
    @IBAction func switchToSyneriseMobileApps1() {
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
    
    @IBAction func switchToSyneriseMobileApps2() {
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
    
    @IBAction func resetApplication() {
        delegate?.resetApplicationWasPressed(self)
        
        fatalError("Crash test!")
    }
    
    @IBAction func executeCrash() {
        let exception = NSException(name: NSExceptionName.genericException, reason: "Synerise Test Crash", userInfo: nil)
        exception.raise()
    }
    
    @IBAction func showDataDebugDescription() {
        #if DEBUG
        let dataDebugDescription = Synerise.getDataDebugDescription()
        self.pushDebugViewController(text: dataDebugDescription)
        #endif
    }
    
    @IBAction func removeAllData() {
        #if DEBUG
        Synerise.clearAllPersistentAndTemporaryData()
        NSException(name: NSExceptionName.genericException, reason: "Restart after removing all items in UserDefaults, Keychain, Files and Cache", userInfo: nil).raise()
        #endif
    }
    
    @IBAction func removeAllSyneriseAuthTokensData() {
        #if DEBUG
        Synerise.clearAuthTokensData()
        NSException(name: NSExceptionName.genericException, reason: "Restart after removing all Synerise authentication tokens in Keychain", userInfo: nil).raise()
        #endif
    }
    
    // MARK: - Inherited
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_DEVELOPER_MENU_TITLE".localized()
        
        prepareLeftMenuButton()
        prepareBackButton()
        
        #if DEBUG
        #else
        for _ in 1...3 {
            let lastView = developerMenuStackView.arrangedSubviews.last!
            developerMenuStackView.removeArrangedSubview(lastView)
            lastView.removeFromSuperview()
        }
        #endif
    }
}
