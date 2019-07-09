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
    
    @IBOutlet weak var typeMembersOnlySwitch: UISwitch!
    @IBOutlet weak var typeCustomSwitch: UISwitch!
    @IBOutlet weak var typeGeneralSwitch: UISwitch!
    
    @IBOutlet weak var includeMetaSwitch: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func getPromotionsList() {
        self.showLoading()
        Promotions.getPromotions(success: { (promotionsList) in
            self.hideLoading()
            
            let debugInfoString = self.makePromotionsListStringRepresentation(promotionsList)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListWithOptions() {
        var statuses: [NSNumber] = [NSNumber]()
        
        if statusActiveSwitch.isOn {
            statuses.append(PromotionStatus.active.rawValue as NSNumber)
        }

        if statusAssignedSwitch.isOn {
            statuses.append(PromotionStatus.assigned.rawValue as NSNumber)
        }

        if statusRedemeedSwitch.isOn {
            statuses.append(PromotionStatus.redeemed.rawValue as NSNumber)
        }
        
        var types: [NSNumber] = [NSNumber]()
        
        if typeMembersOnlySwitch.isOn {
            types.append(PromotionType.membersOnly.rawValue as NSNumber)
        }
        
        if typeCustomSwitch.isOn {
            types.append(PromotionType.custom.rawValue as NSNumber)
        }
        
        if typeGeneralSwitch.isOn {
            types.append(PromotionType.general.rawValue as NSNumber)
        }
        
        let includeMeta: Bool = includeMetaSwitch.isOn
        
        self.showLoading()
        Promotions.getPromotions(statuses: statuses, types: types, limit: 100, page: 1, includeMeta: includeMeta, success: { (promotionsList) in
            self.hideLoading()
            
            let debugInfoString = self.makePromotionsListStringRepresentation(promotionsList)
            self.pushDebugViewController(text: debugInfoString)
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
    
    private func makePromotionsListStringRepresentation(_ response: PromotionResponse) -> String {
        var promotionsListStringRepresentation = ""
        
        response.items.forEach { (object) in
            if let promotion = object as? Promotion {
                let promotionStringRepresentation = makePromotionStringRepresentation(promotion)
                promotionsListStringRepresentation.append("\n- - - - - - - - - - - - - - - - - - - - -\n")
                promotionsListStringRepresentation.append(promotionStringRepresentation)
            }
        }
        
        return promotionsListStringRepresentation
    }
    
    private func makePromotionStringRepresentation(_ response: Promotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = SNR_PromotionStatusToString(response.status)
        let type = SNR_PromotionTypeToString(response.type)
        
        let redeemLimitPerClient = response.redeemLimitPerClient?.stringValue ?? "-"
        let currentRedeemedQuantity = response.currentRedeemedQuantity.stringValue
        let requireRedeemedPoints = response.requireRedeemedPoints?.stringValue ?? "-"
        
        let discountType = SNR_PromotionDiscountTypeToString(response.discountType)
        let discountValue = response.discountValue
        
        let name = response.name
        let headline = response.headline ?? "-"
        let descriptionText = response.descriptionText ?? "-"
        
        let startAt = response.startAt?.description ?? "-"
        let expireIn = response.expireAt?.description ?? "-"
        let lastingAt = response.lastingAt?.description ?? "-"
        
        let images: Any = response.images?.description ?? "-"
        let catalogIndexItems: Any = response.catalogIndexItems ?? "-"
        let params: Any = response.params ?? "-"
        let price = response.price.stringValue
        
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
