//
//  CheckoutDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CheckoutShipToDataSource {
    
    // MARK: - Static
    
    static func getCheckoutShipToModel() -> [CheckoutShipToTableViewModel] {
        return [
            CheckoutShipToTableViewModel(address: "Russia, S. Petersburg 196048 RU\nMilionnaya street 29, flat 10\n+ 7 (902) 564 - 04 - 76")
        ]
    }
}
