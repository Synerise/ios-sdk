//
//  CheckoutPayment.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CheckoutPayment {
    
    let companyLogo: UIImage
    let companyName: String
    let cardNumber: String
    var state: Bool = false
    
    // MARK: - Init
    
    init(companyLogo: UIImage, companyName: String, cardNumber: String) {
        self.companyLogo = companyLogo
        self.companyName = companyName
        self.cardNumber = cardNumber
    }
}
