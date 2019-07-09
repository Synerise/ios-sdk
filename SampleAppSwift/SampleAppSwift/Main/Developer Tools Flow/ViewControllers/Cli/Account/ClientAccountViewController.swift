//
//  ClientAccountViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientAccountViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func getAccountButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getAccount(success: { (clientAccountInformation) in
            self.hideLoading()
            
            let accountInformation = self.makeAccountInformation(clientAccountInformation)
            self.pushDebugViewController(text: accountInformation)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Client Account"
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
