//
//  UpdateEmailTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class UpdateEmailTableViewController: DefaultTableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func updateEmail() {
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        
        showLoading()
        Client.requestEmailChange(email: email, password: password, success: { _ in
            self.hideLoading()
            self.showSuccessInfo()
        }) { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    @IBAction func updateEmailByFacebook() {
        let email = self.emailTextField.text ?? ""
        
        showLoading()
        Client.requestEmailChangeByFacebook(email: email, success: { _ in
            self.hideLoading()
            self.showSuccessInfo()
        }) { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Update Email"
    }
}
