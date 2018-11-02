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
        guard let facebookToken = FBSDKAccessToken.current()?.tokenString else {
            return
        }
        
        self.showLoading()
        Client.authenticate(facebookToken: facebookToken, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }) { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Authorization"
    }
}
