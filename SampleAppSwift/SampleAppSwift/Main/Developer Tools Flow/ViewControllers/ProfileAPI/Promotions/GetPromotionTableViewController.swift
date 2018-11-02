//
//  GetPromotionTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class GetPromotionTableViewController: DefaultTableViewController {

    @IBOutlet weak var uuidTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBAction func getPromotioByUUID() {
        let uuid = self.uuidTextField.text ?? ""
        
        self.showLoading()
        Profile.getPromotion(uuid: uuid, success: { (profilePromotion) in
            self.hideLoading()
        
            DispatchQueue.main.async {
                let debugInfoString = self.makeProfilePromotionStringRepresentation(profilePromotion)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotioByCode() {
        let code = self.codeTextField.text ?? ""
        
        self.showLoading()
        Profile.getPromotion(code: code, success: { (profilePromotion) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeProfilePromotionStringRepresentation(profilePromotion)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Get Promotion"
    }
    
    // MARK: - Private
    
    private func pushToDebugTextViewController(string: String) {
        let debugTextViewController = DebugTextViewController(text: string, copyEnabled: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeProfilePromotionStringRepresentation(_ response: ProfilePromotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = ProfilePromotion.stringFromProfilePromotionStatus(response.status)
        let type = ProfilePromotion.stringFromPromotionType(response.type)
        
        let redeemLimitPerClient = response.redeemLimitPerClient?.stringValue ?? "-"
        let currentRedeemedQuantity = response.currentRedeemedQuantity?.stringValue ?? "-"
        let requireRedeemedPoints = response.requireRedeemedPoints?.stringValue ?? "-"
        
        let discountType = ProfilePromotion.stringFromPromotionDiscountType(response.discountType)
        let discountValue = response.discountValue.stringValue
        
        let name = response.name
        let headline = response.headline ?? "-"
        let descriptionText = response.descriptionText ?? "-"
        
        let startAt = response.startAt?.description ?? "-"
        let expireIn = response.expireIn?.description ?? "-"
        let lastingTime = response.lastingTime?.stringValue ?? "-"
        
        let images: Any = response.images ?? "-"
        let catalogIndexItems: Any = response.catalogIndexItems ?? "-"
        let params: Any = response.params ?? "-"
        let price = response.price?.stringValue ?? "-"
        
        let promotionStringRepresentation = """
        UUID: \(uuid)
        code: \(code)
        status: \(status)
        type: \(type)
        
        redeemLimitPerClient: \(redeemLimitPerClient)
        currentRedeemedQuantity: \(currentRedeemedQuantity)
        requireRedeemedPoints: \(requireRedeemedPoints)
        
        discountType: \(discountType)
        discountValue: \(discountValue)
        
        name: \(name)
        headline: \(headline)
        descriptionText: \(descriptionText)
        
        startAt: \(startAt)
        expireIn: \(expireIn)
        lastingTime: \(lastingTime)
        
        images: \(images as AnyObject)
        catalogIndexItems: \(catalogIndexItems as AnyObject)
        params: \(params as AnyObject)
        price: \(price)
        """
        
        return promotionStringRepresentation
    }
}
