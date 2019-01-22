//
//  ProductDetailsView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import Cosmos

protocol ProductDetailsViewDelegate: class {
    func addProductButtonWasTapped(_ productDetailsView: ProductDetailsView)
    func setFavoriteButtonWasTapped(_ productDetailsView: ProductDetailsView)
}

class ProductDetailsView: DefaultView {
    
    weak var delegate: ProductDetailsViewDelegate?
    
    private weak var viewModel: ProductDetailsViewModel?
    
    @IBOutlet weak var productImageView: DefaultImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var skuLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var setFavoriteButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - IBAction
    
    @IBAction func addProductButtonWasTapped(_ sender: Any) {
        delegate?.addProductButtonWasTapped(self)
    }
    
    @IBAction func setFavoriteButtonWasTapped(_ sender: Any) {
        delegate?.setFavoriteButtonWasTapped(self)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        baseInit()
    }
    
    // MARK: - Public
    
    func setViewModel(_ viewModel: ProductDetailsViewModel) {
        activityIndicator.startAnimating()
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        priceLabel.text = "$\(viewModel.price)"
        productImageView.loadImage(withURL: viewModel.imageURL) { (success) in
                if success {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
        ratingView.rating = viewModel.rating
        brandLabel.text = viewModel.brand
        skuLabel.text = "SKU: " + viewModel.sku
        ratingView.text = "\(viewModel.ratingCount)"
        descriptionTextView.text = viewModel.description
        
        ratingView.didFinishTouchingCosmos = { [weak self] rating in
            self?.viewModel?.sendRatingEvent(rating: rating)
        }
        
        self.priceLabel.isHidden = !viewModel.isPriceVisible
        
        viewModel.isFavorite.observe { (isFavorite) in
            self.isFavorite(isFavorite)
        }
    }
    
    // MARK: - Private
    
    private func baseInit() {
        loadFromXib()
        prepareDefaultAppearance()
    }
    
    private func prepareDefaultAppearance() {
        addProductButton.layer.shadowColor = UIColor.black.cgColor
        addProductButton.layer.shadowOpacity = 0.2
        addProductButton.layer.shadowOffset = CGSize.zero
        addProductButton.layer.shadowRadius = 8
    }
    
    private func isFavorite(_ isFavorite: Bool) {
        if isFavorite {
            self.setFavoriteButton.setImage(UIImage(named: "Shop Flow/icon_favorite_remove"), for: .normal)
        } else {
            self.setFavoriteButton.setImage(UIImage(named: "Shop Flow/icon_favorite_add"), for: .normal)
        }
    }
}
