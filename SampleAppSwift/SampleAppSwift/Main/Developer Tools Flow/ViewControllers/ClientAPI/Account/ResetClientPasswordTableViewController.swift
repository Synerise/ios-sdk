//
//  ResetClientPasswordTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ResetClientPasswordTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientEmailTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func resetClientPasswordButtonWasPressed(_ sender: DefaultButton) {
        resetClientPassword()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Reset Password"
        clientEmailTextField.text = "clientMail@test.com"
    }
    
    // MARK: - Private
    
    private func resetClientPassword() {
        guard let createClientContext = makeClientPasswordResetRequestContext() else { return }
        
        showLoading()
        Client.requestPasswordReset(context: createClientContext, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }) 
    }
    
    private func makeClientPasswordResetRequestContext() -> ClientPasswordResetRequestContext? {
        
        guard let clientEmail = clientEmailTextField.text, clientEmail != "" else {
            clientEmailTextField.animateEmpty(withDuration: 0.3)
            
            return nil
        }
        
        let context = ClientPasswordResetRequestContext.init(email: clientEmail)
        
        return context
    }
}
