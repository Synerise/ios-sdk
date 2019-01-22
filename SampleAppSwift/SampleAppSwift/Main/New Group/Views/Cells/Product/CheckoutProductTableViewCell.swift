//
//  CheckoutProductTableViewCell.swift
//  SampleAppSwift
//
//  Created by BPOL0397 on 06/08/2018.
//

import UIKit

class CheckoutProductTableViewCell: UITableViewCell, Updatable {
    
    static let reuseIdentifier = "CheckoutProductTableViewCell"
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var productImage: DefaultImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        guard let viewModel = object as? CheckoutProductTableViewModel else { return }
        loadImage(viewModel: viewModel)
        productNameLabel.text = viewModel.name
        brandLabel.text = viewModel.brand
        
        if viewModel.isPriceVisible {
            priceLabel.text = viewModel.amount > 1 ? "\(viewModel.amount) x $\(viewModel.price)" : "$\(viewModel.price)"
        } else {
            priceLabel.isHidden = true
        }
    }
    
    // MARK: - Private
    
    private func loadImage(viewModel: CheckoutProductTableViewModel) {
        spinner.startAnimating()
        self.productImage.loadImage(withURL: viewModel.imageURL, completion: { (success) in
            if success {
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
            }
        })
    }
}
