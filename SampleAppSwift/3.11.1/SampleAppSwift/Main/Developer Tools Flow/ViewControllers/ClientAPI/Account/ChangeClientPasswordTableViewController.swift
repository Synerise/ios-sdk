//
//  ChangeClientPasswordTableViewController
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ChangeClientPasswordTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var newClientPasswordTextField: UITextField!
    @IBOutlet weak var oldClientPasswordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func changeClientPassword() {
        guard let password = newClientPasswordTextField.text, !password.isEmpty else { return }
        guard let oldPassword = oldClientPasswordTextField.text, !oldPassword.isEmpty else { return }
        
        self.showLoading()
        Client.changePassword(password: password, oldPassword: oldPassword, success: { (_) in
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
        
        self.navigationItem.title = "Change Client Password"
    }
}
