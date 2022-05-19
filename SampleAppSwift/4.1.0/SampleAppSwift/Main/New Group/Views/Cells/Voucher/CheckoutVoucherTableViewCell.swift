//
//  CheckoutVoucherTableViewCell.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class CheckoutVoucherTableViewCell: UITableViewCell, Updatable {

    static let reuseIdentifier = "CheckoutVoucherTableViewCell"
    
    @IBOutlet weak var voucherCodeTextField: BindingTextField!
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        if let viewModel = object as? CheckoutVoucherTableViewModel {
            voucherCodeTextField.bind(to: viewModel.voucherCode)
        }
    }
}
