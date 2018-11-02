//
//  ClientVouchersViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientVouchersViewController: DefaultViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Client Vouchers"
    }
    
    // MARK: - IBAction
    
    @IBAction func getAssignedVoucherCodesButtonWasPressed(_ sender: UIButton) {
        showLoading()
        
        Client.getAssignedVoucherCodes(success: { (voucherCodesResponse) in
            self.hideLoading()
            let debugInfoString = self.makeVoucherStringRepresentation(voucherCodesResponse)
            DispatchQueue.main.async {
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func pushToDebugTextViewController(string: String) {
        let debugTextViewController = DebugTextViewController(text: string, copyEnabled: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeVoucherStringRepresentation(_ response: VoucherCodesResponse) -> String {
        
        var promotionStringRepresentation: String = ""
        
        for vouchers in response.vouchers {
            if let voucher = vouchers as? VoucherCodesData {
                
                let code = voucher.code ?? "nil"
                let status = voucher.status ?? "nil"
                let clientId = voucher.clientId ?? "nil"
                let clientUuid = voucher.clientUuid ?? "nil"
                let poolUuid = voucher.poolUuid ?? "nil"
                let expireIn = voucher.expireIn?.description ?? "nil"
                let redeemAt = voucher.redeemAt?.description ?? "nil"
                let assignedAt = voucher.assignedAt?.description ?? "nil"
                let createdAt = voucher.createdAt?.description ?? "nil"
                let updatedAt = voucher.updatedAt?.description ?? "nil"
                
                promotionStringRepresentation += """
                
                code: \(code)
                status: \(status)
                clientID: \(clientId)
                clientUUID: \(clientUuid)
                poolUUID: \(poolUuid)
                expireIn: \(expireIn)
                redeemAt: \(redeemAt)
                assignedAt: \(assignedAt)
                createdAt: \(createdAt)
                updatedAt: \(updatedAt)
                
                """
            }
        }
        
        return promotionStringRepresentation
    }
}
