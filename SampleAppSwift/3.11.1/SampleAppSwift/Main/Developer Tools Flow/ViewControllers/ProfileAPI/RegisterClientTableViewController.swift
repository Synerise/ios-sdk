//
//  RegisterClientTableView.swift
//  SampleAppSwift
//
//  Created by BPOL0397 on 30/07/2018.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class RegisterWithEmailClientTableViewController: DefaultTableViewController {
    
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
        self.navigationItem.title = "Register Client Context"
        clientContextEmailTextField.text = "registerClient@toreforge.com"
    }
    
    // MARK: - Private
    
    private func registerClient() {
        
        guard let registerClientContext = makeRegisterClientContext() else { return }
        
        Profile.registerClient(registerClientContext, success: { (success) in
            if success {
                self.showSuccess()
            }
        }, failure: { (error) in
             self.showError(error)
        })
        
    }
    
    private func makeRegisterClientContext() -> RegisterClientContext? {
        
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
        
        let context = RegisterClientContext.init(email, password: password)
       
        context.firstName = clientContextFirstNameTextField.text
        context.lastName = clientContextLastNameTextField.text
        context.customId = clientContextCustomIDTextField.text
        context.city = clientContextCityNameTextField.text
        
        return context
    }
    
    private func showSuccess() {
        UserInfoMessageManager.shared.success("Success", "Client was registered")
    }
    
    private func showError(_ error: Error) {
        UserInfoMessageManager.shared.error("Error", "Error with client registeration")
        DebugUtils.print("Error with client registeration: \(error)")
    }
}
