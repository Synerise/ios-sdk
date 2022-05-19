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

    @IBOutlet weak var tokenTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmEmail() {
        let token = self.tokenTextField.text ?? ""
        
        showLoading()
        Client.confirmEmailChange(token: token, newsletterAgreement: true, success: { _ in
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
