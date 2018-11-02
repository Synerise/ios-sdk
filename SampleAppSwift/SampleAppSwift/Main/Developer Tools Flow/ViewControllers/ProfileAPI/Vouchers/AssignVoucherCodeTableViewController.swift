//
//  AssignVoucherCodeTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class AssignVoucherCodeTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var poolUUIDTextField: UITextField!
    @IBOutlet weak var clientUUIDTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func assignVoucherCodeButtonWasPressed(_ sender: DefaultButton) {
        assignVoucherCode()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Assign Voucher Code"
    }
    
    // MARK: - Private
    
    private func assignVoucherCode() {
        
        var clientUUID: String? = nil
        
        guard let poolUUID = poolUUIDTextField.text, poolUUID != "" else {
            poolUUIDTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        if let clientUUIDGuarded = clientUUIDTextField.text, !clientUUIDGuarded.isEmpty {
            clientUUID = clientUUIDGuarded
        }
        
        showLoading()
        Profile.assignVoucherCode(poolUUID: poolUUID, clientUUID: clientUUID, success: { (assignVoucherResponse) in
            self.hideLoading()
            let debugInfoString = self.makeVoucherStringRepresentation(assignVoucherResponse)
            DispatchQueue.main.async {
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func pushToDebugTextViewController(string: String) {
        let debugTextViewController = DebugTextViewController(text: string, copyEnabled: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeVoucherStringRepresentation(_ response: AssignVoucherResponse) -> String {
        
        let message = response.message ?? "nil"
        let code = response.data?.code ?? "nil"
        let expireIn = response.data?.expireIn?.description ?? "nil"
        let redeemAt = response.data?.redeemAt?.description ?? "nil"
        let assignedAt = response.data?.assignedAt?.description ?? "nil"
        let createdAt = response.data?.createdAt?.description ?? "nil"
        let updatedAt = response.data?.updatedAt?.description ?? "nil"
        
        let promotionStringRepresentation = """
        message: \(message)
        code: \(code)
        expireIn: \(expireIn)
        redeemAt: \(redeemAt)
        assignedAt: \(assignedAt)
        createdAt: \(createdAt)
        updatedAt: \(updatedAt)
        """
        
        return promotionStringRepresentation
    }
}
