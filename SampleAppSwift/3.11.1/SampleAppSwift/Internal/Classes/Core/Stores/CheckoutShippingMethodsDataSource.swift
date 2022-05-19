//
//  CheckoutShippingMethodsDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CheckoutShippingMethodsDataSource {
    
    // MARK: - Static
    
    static func getShippingModels() -> [CheckoutShippingMethod] {
        return [
            CheckoutShippingMethod(providerName: "Express (DHL)", deliveryTime: "1 day", price: "Free"),
            CheckoutShippingMethod(providerName: "UK Post", deliveryTime: "1-2 weeks", price: "$20")
        ]
    }
}
