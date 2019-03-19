//
//  LogInClientTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class LogInWithEmailClientTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientEmailTextField: UITextField!
    @IBOutlet weak var clientPasswordTextField: UITextField!
    @IBOutlet weak var deviceIDTextField: UITextField!
   
    // MARK: - IBAction
    
    @IBAction func logInButtonWasPressed(_ sender: DefaultButton) {
        logIn()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Log In With Email"
    }
    
    // MARK: - Private
    
    private func logIn() {
        guard let email = clientEmailTextField.text else {
            clientEmailTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        guard let password = clientPasswordTextField.text else {
            clientPasswordTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        let deviceID = deviceIDTextField.text

        showLoading()
        Client.signIn(email: email, password: password, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
}
