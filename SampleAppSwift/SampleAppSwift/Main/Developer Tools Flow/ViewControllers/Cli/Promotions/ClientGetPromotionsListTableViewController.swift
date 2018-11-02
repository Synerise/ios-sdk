//
//  ClientGetPromotionsListTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class ClientGetPromotionsListTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var statusActiveSwitch: UISwitch!
    @IBOutlet weak var statusAssignedSwitch: UISwitch!
    @IBOutlet weak var statusRedemeedSwitch: UISwitch!
    @IBOutlet weak var statusPresentOnlySwitch: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func getPromotionsList() {
        self.showLoading()
        Client.getPromotions(success: { (clientPromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeClientPromotionsListStringRepresentation(clientPromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListWithOptions() {
        var statuses: [NSNumber] = [NSNumber]()
        
        if statusActiveSwitch.isOn {
            statuses.append(ClientPromotionStatus.active.rawValue as NSNumber)
        }

        if statusAssignedSwitch.isOn {
            statuses.append(ClientPromotionStatus.assigned.rawValue as NSNumber)
        }

        if statusRedemeedSwitch.isOn {
            statuses.append(ClientPromotionStatus.redeemed.rawValue as NSNumber)
        }
        
        let excludeExpired: Bool = statusPresentOnlySwitch.isOn
        
        self.showLoading()
        Client.getPromotions(statuses: statuses, excludeExpired: excludeExpired, success: { (clientPromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeClientPromotionsListStringRepresentation(clientPromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Promotions List"
    }
    
    // MARK: - Private
    
    private func pushToDebugTextViewController(string: String) {
        let debugTextViewController = DebugTextViewController(text: string, copyEnabled: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeClientPromotionsListStringRepresentation(_ response: ClientPromotionResponse) -> String {
        var promotionsListStringRepresentation = ""
        
        response.promotions.forEach { (object) in
            if let promotion = object as? ClientPromotion {
                let promotionStringRepresentation = makeClientPromotionStringRepresentation(promotion)
                promotionsListStringRepresentation.append("\n- - - - - - - - - - - - - - - - - - - - -\n")
                promotionsListStringRepresentation.append(promotionStringRepresentation)
            }
        }
        
        return promotionsListStringRepresentation
    }
    
    private func makeClientPromotionStringRepresentation(_ response: ClientPromotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = ClientPromotion.stringFromClientPromotionStatus(response.status)
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
        let lastingAt = response.lastingAt?.stringValue ?? "-"
        
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
        lastingAt: \(lastingAt)
        
        images: \(images as AnyObject)
        catalogIndexItems: \(catalogIndexItems as AnyObject)
        params: \(params as AnyObject)
        price: \(price)
        """
        
        return promotionStringRepresentation
    }
    
}
