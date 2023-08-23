//
//  ConfrimPasswordResetTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ConfirmPasswordResetTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientPasswordTextField: UITextField!
    @IBOutlet weak var tokenTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmPasswordResetButtonWasPressed(_ sender: DefaultButton) {
        confirmPasswordReset()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Confrim Password Reset"
    }
    
    // MARK: - Private
    
    private func confirmPasswordReset() {
        guard let context = makeClientPasswordResetConfirmationContext() else { return }
        
        showLoading()
        Client.confirmResetPassword(context: context, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
    }
    
    private func makeClientPasswordResetConfirmationContext() -> ClientPasswordResetConfirmationContext? {
        
        guard let clientPassword = clientPasswordTextField.text, clientPassword != "" else {
            clientPasswordTextField.animateEmpty(withDuration: 0.3)
            
            return nil
        }
        
        guard let token = tokenTextField.text, clientPassword != "" else {
            tokenTextField.animateEmpty(withDuration: 0.3)
            
            return nil
        }
        
        let context = ClientPasswordResetConfirmationContext.init(password: clientPassword, token: token)
        
        return context
    }
}
