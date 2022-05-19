//
//  CheckoutShipToTableViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CheckoutShipToTableViewCell: UITableViewCell, Updatable {
    
    static let reuseIdentifier = "CheckoutShipToTableViewCell"
    
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        if let viewModel = object as? CheckoutShipToTableViewModel {
            addressLabel.text = viewModel.address
        }
    }
}
