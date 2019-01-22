//
//  ProductItemCollectionViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class ProductItemCollectionViewCell: UICollectionViewCell, Updatable {
    
    static let reuseIdentifier = "ProductItemCollectionViewCell"
    
    @IBOutlet weak var productImage: DefaultImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        
        if let viewModel = object as? ProductItemCollectionViewModel {
            setImage(viewModel: viewModel)
            productNameLabel.text = viewModel.name
            brandLabel.text = viewModel.brand
            priceLabel.text = viewModel.priceWithCurrency()
            priceLabel.isHidden = !viewModel.isPriceVisible
        }
    }
    
    // MARK: - Private
    
    private func setImage(viewModel: ProductItemCollectionViewModel) {
        spinner.startAnimating()
        if let imageURL = viewModel.imageURL {
            self.productImage.loadImage(withURL: imageURL, completion: { (success) in
                if success {
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                }
            })
        }
    }
}
