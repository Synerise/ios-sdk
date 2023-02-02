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
    }
    
    @IBAction func resetKeychain() {
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
    }
    
    @IBAction func executeCrash() {
        let exception = NSException(name: NSExceptionName.genericException, reason: "Synerise Test Crash", userInfo: nil)
        exception.raise()
    }
    
    @IBAction func showDataDebugDescription() {
        let selector = NSSelectorFromString("getDataDebugDescription")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            let dataDebugDescription = unmanaged?.takeUnretainedValue() as? String
            self.pushDebugViewController(text: dataDebugDescription!)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func showInAppDebugDescription() {
        let selector = NSSelectorFromString("getInAppDebugDescription")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            let dataDebugDescription = unmanaged?.takeUnretainedValue() as? String
            self.pushDebugViewController(text: dataDebugDescription!)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func removeAllData() {
        let selector = NSSelectorFromString("clearAllPersistentAndTemporaryData")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            NSException(name: NSExceptionName.genericException, reason: "Restart after removing all items in UserDefaults, Keychain, Files and Cache", userInfo: nil).raise()
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func removeAllnAppData() {
        let selector = NSSelectorFromString("clearAllInAppData")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            NSException(name: NSExceptionName.genericException, reason: "Restart after removing all items from InApp database", userInfo: nil).raise()
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func removeAllSyneriseAuthTokensData() {
        let selector = NSSelectorFromString("clearAuthTokensData")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            NSException(name: NSExceptionName.genericException, reason: "Restart after removing all Synerise authentication tokens in Keychain", userInfo: nil).raise()
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    // MARK: - Inherited
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_DEVELOPER_MENU_TITLE".localized()
        
        prepareLeftMenuButton()
        prepareBackButton()
    }
}
