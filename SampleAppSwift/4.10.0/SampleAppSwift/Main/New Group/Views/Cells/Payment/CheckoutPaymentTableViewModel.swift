//
//  CheckoutPaymentTableViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CheckoutPaymentTableViewModel {
    
    let companyLogo: UIImage
    let companyName: String
    let cardNumber: String
    var state: Bool
    
    // MARK: - Init
    
    init(model: CheckoutPayment) {
        self.companyLogo = model.companyLogo
        self.companyName = model.companyName
        self.cardNumber = model.cardNumber
        self.state = model.state
    }
}
