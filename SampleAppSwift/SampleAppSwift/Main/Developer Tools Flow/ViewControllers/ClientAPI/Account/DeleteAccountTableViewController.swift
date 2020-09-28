//
//  DeleteAccountTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class DeleteAccountTableViewController: DefaultTableViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deleteAccount() {
        let password = passwordTextField.text ?? ""
        
        showLoading()
        Client.deleteAccount(password: password, success: { (isSuccess) in
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
