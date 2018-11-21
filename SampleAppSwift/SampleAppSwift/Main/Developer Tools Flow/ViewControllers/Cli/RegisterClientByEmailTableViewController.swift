//
//  RegisterWithEmailClientTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RegisterClientByEmailTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientContextEmailTextField: UITextField!
    @IBOutlet weak var clientContextPasswordTextField: UITextField!
    @IBOutlet weak var clientContextFirstNameTextField: UITextField!
    @IBOutlet weak var clientContextLastNameTextField: UITextField!
    @IBOutlet weak var clientContextCustomIDTextField: UITextField!
    @IBOutlet weak var clientContextCityNameTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func registerClientButtonWasPressed(_ sender: DefaultButton) {
        registerClient()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Register Client By Email"
        clientContextEmailTextField.text = "registerClient@toreforge.com"
    }
    
    // MARK: - Private
    
    private func registerClient() {
        guard let registerClientContext = makeRegisterClientContext() else { return }
        
        showLoading()
        Client.registerAccount(context: registerClientContext, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.showErrorInfo(error as NSError)
            self.hideLoading()
        })
    }
    
    private func makeRegisterClientContext() -> ClientRegisterAccountContext? {
        guard let email = clientContextEmailTextField.text, email != "" else {
            
            let emailRow = IndexPath(row: 0, section: 0)
            DispatchQueue.main.async {
                self.tableView.scrollToRow(at: emailRow, at: .middle, animated: true)
                self.clientContextEmailTextField.becomeFirstResponder()
            }
            
            return nil
        }
        
        guard let password = clientContextPasswordTextField.text, password != "" else {
            
            let passwordRow = IndexPath(row: 0, section: 1)
            DispatchQueue.main.async {
                self.tableView.scrollToRow(at: passwordRow, at: .middle, animated: true)
                self.clientContextPasswordTextField.becomeFirstResponder()
            }
            
            return nil
        }
        
        let context = ClientRegisterAccountContext.init(email: email, password: password)
        
        context.firstName = clientContextFirstNameTextField.text
        context.lastName = clientContextLastNameTextField.text
        context.customId = clientContextCustomIDTextField.text
        context.city = clientContextCityNameTextField.text
        
        return context
    }
}
