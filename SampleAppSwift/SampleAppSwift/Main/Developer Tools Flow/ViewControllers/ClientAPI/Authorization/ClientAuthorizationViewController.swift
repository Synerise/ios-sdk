//
//  ClientAuthorizationViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

class ClientAuthorizationViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func authenticateByFacebook() {
        guard let facebookToken = AccessToken.current?.tokenString else {
            return
        }
        
        Client.authenticateByFacebookIfRegistered(facebookToken: facebookToken, authID: "", success: { isSuccess in
            if isSuccess {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }) { (error) in
            let agreements: ClientAgreements = ClientAgreements()
            
            let context: ClientFacebookAuthenticationContext = ClientFacebookAuthenticationContext()
            context.agreements = agreements
            context.attributes = ["param": "value"]
            
            Client.authenticateByFacebook(facebookToken: facebookToken, authID: "", context: context, success: { isSuccess in
                if isSuccess {
                    self.hideLoading()
                    self.showSuccessInfo()
                }
            }, failure: { error in
                self.hideLoading()
                self.showErrorInfo(error as NSError)
            })
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Authorization"
    }
}
