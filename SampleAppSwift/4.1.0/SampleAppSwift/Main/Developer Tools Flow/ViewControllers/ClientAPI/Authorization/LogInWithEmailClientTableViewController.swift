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
   
    // MARK: - IBAction
    
    @IBAction func logInWithLegacyMethodButtonWasPressed(_ sender: DefaultButton) {
        logIn_legacyMethod()
    }
    
    @IBAction func logInWithConsolidatedMethodButtonWasPressed(_ sender: DefaultButton) {
        login_consolidatedMethod()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Log In With Email"
    }
    
    // MARK: - Private
    
    private func logIn_legacyMethod() {
        guard let email = clientEmailTextField.text else {
            clientEmailTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        guard let password = clientPasswordTextField.text else {
            clientPasswordTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        showLoading()
        Client.signIn(email: email, password: password, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (apiError) in
            self.hideLoading()
            self.showErrorInfo(apiError as NSError)
        })
    }
    
    private func login_consolidatedMethod() {
        guard let email = clientEmailTextField.text else {
            clientEmailTextField.animateEmpty(withDuration: 0.3)
            return
        }
        
        guard let password = clientPasswordTextField.text else {
            clientPasswordTextField.animateEmpty(withDuration: 0.3)
            return
        }
        
        showLoading()
        Client.signInConditionally(email: email, password: password) { authResult in
            if authResult.status == .success {
                self.hideLoading()
                self.showSuccessInfo()
            } else {
                self.hideLoading()
                
                let statusString = SNR_ClientConditionalAuthStatusToString(authResult.status)
                let alertController = UIAlertController(title: "Conditional Auth Result", message: "Status is \(statusString)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        } failure: { apiError in
            self.hideLoading()
            self.showErrorInfo(apiError as NSError)
        }
    }
}
