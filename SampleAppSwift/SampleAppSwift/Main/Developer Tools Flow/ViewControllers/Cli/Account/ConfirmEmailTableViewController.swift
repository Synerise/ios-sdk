//
//  ConfirmEmailTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ConfirmEmailTableViewController: DefaultTableViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tokenTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmEmail() {
        let password = self.passwordTextField.text ?? ""
        let token = self.tokenTextField.text ?? ""
        
        Client.confirmEmailChange(password: password, token: token, success: { _ in
            self.showSuccessInfo()
        }) { (error) in
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Update Email"
    }
}
