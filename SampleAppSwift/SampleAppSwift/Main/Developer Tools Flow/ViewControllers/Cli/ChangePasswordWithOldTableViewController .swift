//
//  ChangePasswordWithOldTableViewController .swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ChangePasswordWithOldTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var oldClientPasswordTextField: UITextField!
    @IBOutlet weak var newClientPasswordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func changeClientPassword() {
        guard let oldPassword = oldClientPasswordTextField.text, !oldPassword.isEmpty else { return }
        guard let newPassword = newClientPasswordTextField.text, !newPassword.isEmpty else { return }
        
        self.showLoading()
        
        do {
            try SNRExceptionHandler.catchException {
                Client.changePassword(newPassword: newPassword, oldPassword: oldPassword, success: { (_) in
                    self.showSuccessInfo()
                }, failure: { (error) in
                    self.hideLoading()
                    self.showErrorInfo(error as NSError)
                })
            }
        } catch let error as NSError {
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Change Password With Old Password"
    }
}
