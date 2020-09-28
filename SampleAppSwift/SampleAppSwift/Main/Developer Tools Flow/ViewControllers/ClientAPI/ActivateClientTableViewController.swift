//
//  ActivateClientTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ActivateClientTableViewController: DefaultTableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func activateClient() {
        let email = self.emailTextField.text ?? ""
        
        showLoading()
        Client.activateAccount(email: email, success: { _ in
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
        
        self.navigationItem.title = "Activate Client"
    }
}
