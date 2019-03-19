//
//  ClientAPI.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK
import FBSDKCoreKit
import FBSDKLoginKit

class ClientAPIViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func getUUIDButtonWasPressed(_ sender: DefaultButton) {
        let UUID: String = Client.getUUID()
        
        let debugTextViewController = makeDebugTextViewController(labelText: UUID, barTitle: "Get UUID")
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    @IBAction func getTokenButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getToken(success: { (token, origin) in
            self.hideLoading()
            let tokenDescription = SNR_TokenOriginToString(origin) + "\n\n" + token
            self.pushToShowToken(token: tokenDescription)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func getFacebookTokenButtonWasPressed(_ sender: DefaultButton) {
        guard let facebookToken = FBSDKAccessToken.current()?.tokenString else {
            return
        }
        
        self.pushToShowToken(token: facebookToken)
    }
    
    @IBAction func deleteAccountWithSuccess(_ sender: DefaultButton) {
        self.showLoading()
        
        Client.deleteAccount(password: "", success: { (_) in
            Client.signOut()
            
            self.hideLoading()
            self.showSuccessInfo()

            self.navigationController?.popToRootViewController(animated: true)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        sender.animateTapping()
    }
    
    @IBAction func regenerateUUID() {
        Client.regenerateUUID()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_CLIENT_API_TITLE".localized()
    }
    
    // MARK: - Private
    
    private func pushToShowToken(token: String) {
        let debugTextViewController = makeDebugTextViewController(labelText: token, barTitle: "Get Client Token")
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func pushToShowClientAccountInformation(accountInformation: String) {
        let debugTextViewController = makeDebugTextViewController(labelText: accountInformation, barTitle: "Show Client Account Information")
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeDebugTextViewController(labelText: String, barTitle: String, copyEnable: Bool = true) -> DebugTextViewController {
        let debugTextViewController = DebugTextViewController(text: labelText, copyEnabled: copyEnable)
        
        return debugTextViewController
    }
    
    private func makeAccountInformation(_ clientAccountInformation: ClientAccountInformation) -> String {
        let firstName = clientAccountInformation.firstName ?? "nil"
        let lastName = clientAccountInformation.lastName ?? "nil"
        let adress = clientAccountInformation.address ?? "nil"
        let birthDate = clientAccountInformation.birthDate ?? "nil"
        let phoneNumber = clientAccountInformation.phone ?? "nil"
        let displayName = clientAccountInformation.displayName ?? "nil"
        
        let accountStringRepresintation = """
        First Name: \(firstName)
        Last Name: \(lastName)
        Address: \(adress)
        BirthDate: \(birthDate)
        Phone Number: \(phoneNumber)
        Display Name: \(displayName)
        """
        
        return accountStringRepresintation
    }
}
