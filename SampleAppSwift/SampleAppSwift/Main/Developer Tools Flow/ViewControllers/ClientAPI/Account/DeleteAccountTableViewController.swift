//
//  DeleteAccountTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

class DeleteAccountTableViewController: DefaultTableViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deleteAccount() {
        if let password = passwordTextField.text, password.count > 0 {
            showLoading()
            
            Client.deleteAccount(clientAuthFactor: password, clientIdentityProvider: .synerise, authID: nil) { (isSuccess) in
                self.hideLoading()
                self.showSuccessInfo()
            } failure: { (error) in
                self.hideLoading()
                self.showErrorInfo(error as NSError)
            }
        } else {
            Client.retrieveToken { (token) in
                if token.tokenOrigin == .facebook {
                    guard let facebookToken = AccessToken.current?.tokenString else {
                        return
                    }
                    
                    Client.deleteAccount(clientAuthFactor: facebookToken, clientIdentityProvider: .facebook, authID: nil) { (isSuccess) in
                        self.hideLoading()
                        self.showSuccessInfo()
                    } failure: { (error) in
                        self.hideLoading()
                        self.showErrorInfo(error as NSError)
                    }
                }
                
                
                
            } failure: { (error) in
                
            }

        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Delete Account"
    }

}
