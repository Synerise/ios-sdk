//
//  DeleteAccountByFacebookTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

class DeleteAccountByFacebookTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var facebookTokenTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deleteAccount() {
        let facebookToken = facebookTokenTextField.text ?? ""
        
        showLoading()
        Client.deleteAccountByFacebook(facebookToken: facebookToken, success: { (isSuccess) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Delete Account"
        
        facebookTokenTextField.text = AccessToken.current?.tokenString ?? ""
    }

}
