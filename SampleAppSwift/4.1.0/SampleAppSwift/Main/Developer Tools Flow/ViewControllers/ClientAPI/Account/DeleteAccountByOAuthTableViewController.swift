//
//  DeleteAccountByOAuthTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class DeleteAccountByOAuthTableViewController: DefaultTableViewController {

    @IBOutlet weak var accessTokenTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deleteAccount() {
        let accessToken = accessTokenTextField.text ?? ""
        
        showLoading()
        Client.deleteAccountByOAuth(accessToken: accessToken, success: { (isSuccess) in
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
    }
}
