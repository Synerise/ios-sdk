//
//  CheckoutShippingTableViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

protocol CheckoutShippingMethodTableViewCellDelegate: class {
    func controlButtonValueWasChanged(_ cell: CheckoutShippingMethodTableViewCell)
}

class CheckoutShippingMethodTableViewCell: UITableViewCell, Updatable {
    
    static let reuseIdentifier = "CheckoutShippingMethodTableViewCell"
    
    weak var delegate: CheckoutShippingMethodTableViewCellDelegate?
    
    @IBOutlet weak var providerNameLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var checkboxButton: CheckboxButton!
    
    // MARK: - IBAction
    
    @IBAction func checkboxButtonValueChanged(_ sender: CheckboxButton) {
        delegate?.controlButtonValueWasChanged(self)
    }
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        guard let viewModel = object as? CheckoutShippingMethodTableViewModel else { return }
        providerNameLabel.text = viewModel.providerName
        deliveryTimeLabel.text = viewModel.deliveryTime
        priceLabel.text = viewModel.price
        checkboxButton.on = viewModel.state
    }
    
}
