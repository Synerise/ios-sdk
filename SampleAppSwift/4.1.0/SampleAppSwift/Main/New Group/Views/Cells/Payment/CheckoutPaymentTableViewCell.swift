//
//  CheckoutPaymentTableViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

protocol CheckoutPaymentTableViewCellDelegate: class {
    func checkboxButtonValueChanged(_ cell: CheckoutPaymentTableViewCell)
}

class CheckoutPaymentTableViewCell: UITableViewCell, Updatable {

    static let reuseIdentifier = "CheckoutPaymentTableViewCell"
    
    weak var delegate: CheckoutPaymentTableViewCellDelegate?
    
    @IBOutlet weak var companyLogoImageView: DefaultImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var checkboxButton: CheckboxButton!
    
    // MARK: - IBAction
    
    @IBAction func checkboxButtonValueChanged(_ sender: CheckboxButton) {
        delegate?.checkboxButtonValueChanged(self)
    }
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        if let viewModel = object as? CheckoutPaymentTableViewModel {
            companyLogoImageView.image = viewModel.companyLogo
            companyNameLabel.text = viewModel.companyName
            cardNumberLabel.text = viewModel.cardNumber
            checkboxButton.on = viewModel.state
        }
    }
}
