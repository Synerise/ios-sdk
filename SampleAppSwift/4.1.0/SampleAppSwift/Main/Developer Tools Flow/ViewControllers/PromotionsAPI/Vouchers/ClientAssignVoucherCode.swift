//
//  ClientAssignVoucherCodeTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

//swiftlint:disable type_name
class ClientAssignVoucherCodeTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var poolUUIDTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func assignVoucherCodeButtonWasPressed(_ sender: DefaultButton) {
        assignVoucherCode()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Client Assign Voucher Code"
    }
    
    // MARK: - Private
    
    private func assignVoucherCode() {
        
        guard let poolUUID = poolUUIDTextField.text, poolUUID != "" else {
            poolUUIDTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        showLoading()
        Promotions.assignVoucherCode(poolUUID: poolUUID, success: { (assignVoucherResponse) in
            self.hideLoading()
            
            let debugInfoString = self.makeVoucherStringRepresentation(assignVoucherResponse)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func makeVoucherStringRepresentation(_ response: AssignVoucherResponse) -> String {
        
        let message = response.message
        let code = response.assignVoucherData.code
        let expireIn = response.assignVoucherData.expireIn?.description ?? "nil"
        let redeemAt = response.assignVoucherData.redeemAt?.description ?? "nil"
        let assignedAt = response.assignVoucherData.assignedAt?.description ?? "nil"
        let createdAt = response.assignVoucherData.createdAt.description
        let updatedAt = response.assignVoucherData.updatedAt.description
        
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
