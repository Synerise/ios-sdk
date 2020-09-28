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
    
    @IBAction func recognizeAnonymousButtonWasPressed(_ sender: DefaultButton) {
        Client.recognizeAnonymous(email: "hello@synerise.com", customIdentify: "Synerise", parameters: nil)
        
        sender.animateTapping()
    }
    
    @IBAction func getUUIDButtonWasPressed(_ sender: DefaultButton) {
        let UUID: String = Client.getUUID()
        
        self.presentAlert(title: "UUID", message: UUID)
    }
    
    @IBAction func refreshTokenButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.refreshToken(success: { () in
            self.hideLoading()
            self.presentAlert(title: "Client Token has refreshed", message: "")
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func getTokenButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getToken(success: { (token, origin) in
            self.hideLoading()
            
            let tokenDescription = SNR_TokenOriginToString(origin) + "\n\n" + token
            self.pushDebugViewController(text: tokenDescription)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func retrieveTokenButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.retrieveToken(success: { (token) in
            self.hideLoading()
            
            let tokenDescription = SNR_TokenOriginToString(token.tokenOrigin) + "\n\n" + token.claimsDictionary.description + "\n\n" + (token.tokenString as String)
            self.pushDebugViewController(text: tokenDescription)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func getFacebookTokenButtonWasPressed(_ sender: DefaultButton) {
        guard let facebookToken = AccessToken.current?.tokenString else {
            return
        }
        
        self.pushDebugViewController(text: facebookToken)
    }
    
    @IBAction func regenerateUUID() {
        Client.regenerateUUID()
    }
    
    @IBAction func destroySession() {
        Client.destroySession()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_CLIENT_API_TITLE".localized()
    }
    
    // MARK: - Private
    
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
