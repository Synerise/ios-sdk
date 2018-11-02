//
//  RegisterClientByPhoneViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RegisterClientByPhoneViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientContextPhoneTextField: UITextField!
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
        
        self.navigationItem.title = "Register Client By Phone"
        clientContextPhoneTextField.text = "123456789"
    }
    
    // MARK: - Private
    
    private func registerClient() {
        guard let registerClientContext = makeRegisterClientContext() else { return }
        
        showLoading()
        Profile.registerClient(registerClientContext, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func makeRegisterClientContext() -> RegisterClientContext? {
        
        guard let phone = clientContextPhoneTextField.text, phone != "" else {
            
            let phoneRow = IndexPath(row: 0, section: 0)
            DispatchQueue.main.async {
                self.tableView.scrollToRow(at: phoneRow, at: .middle, animated: true)
                self.clientContextPhoneTextField.becomeFirstResponder()
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
        
        let context = RegisterClientContext.init(phoneNumber: phone, password: password)
        
        context.firstName = clientContextFirstNameTextField.text
        context.lastName = clientContextLastNameTextField.text
        context.customId = clientContextCustomIDTextField.text
        context.city = clientContextCityNameTextField.text
        
        return context
    }
}
