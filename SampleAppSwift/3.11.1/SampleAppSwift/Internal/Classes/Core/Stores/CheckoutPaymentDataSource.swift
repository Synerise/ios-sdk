//
//  CheckoutPaymentDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CheckoutPaymentDataSource {
    
    // MARK: - Static
    
    static func getCheckoutPaymentModels() -> [CheckoutPayment] {
        return [
            CheckoutPayment(companyLogo: UIImage(named: "Cart/logo_mastercard")!, companyName: "Credit Card:", cardNumber: "4276 **** **** ****"),
            CheckoutPayment(companyLogo: UIImage(named: "Cart/logo_paypal")!, companyName: "PayPal:", cardNumber: "Please sign in")
        ]
    }
}
