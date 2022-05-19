//
//  ClientDeactivatePromotionsTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientDeactivatePromotionsTableViewController: DefaultTableViewController {

    @IBOutlet weak var uuidsTextField: UITextField!
    @IBOutlet weak var codesTextField: UITextField!
    
    @IBAction func deactivatePromotionsWithUUIDIdentifiers() {
        guard let uuids = self.uuidsTextField.text,
              !uuids.isEmpty else {
            return
        }
        let uuidsArray = uuids.components(separatedBy: ",").filter { !$0.isEmpty }
        if uuidsArray.isEmpty {
            return
        }
        
        var promotionIdentifiers: [PromotionIdentifier] = [PromotionIdentifier]()
        uuidsArray.forEach { uuid in
            let promotionIdentifier = PromotionIdentifier(uuid: uuid)
            promotionIdentifiers.append(promotionIdentifier)
        }
        
        self.showLoading()
        Promotions.deactivatePromotions(identifiers: promotionIdentifiers, success: { (success) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func deactivatePromotionsWithCodeIdentifiers() {
        guard let codes = self.codesTextField.text,
              !codes.isEmpty else {
            return
        }
        
        let codesArray = codes.components(separatedBy: ",").filter { !$0.isEmpty }
        if codesArray.isEmpty {
            return
        }
        
        var promotionIdentifiers: [PromotionIdentifier] = [PromotionIdentifier]()
        codesArray.forEach { code in
            let promotionIdentifier = PromotionIdentifier(code: code)
            promotionIdentifiers.append(promotionIdentifier)
        }
        
        self.showLoading()
        Promotions.deactivatePromotions(identifiers: promotionIdentifiers, success: { (success) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Deativate Promotions"
    }
}
