//
//  SectionItemCollectionViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class SectionItemCollectionViewCell: UICollectionViewCell, Updatable {
    
    static let reuseIdentifier = "SectionItemCollectionViewCell"

    @IBOutlet weak var bottomTextLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var patternImage: DefaultImageView!
    @IBOutlet weak var backgroundImage: DefaultImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var containerView: DefaultView!
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        if let viewModel = object as? SectionItemCollectionViewModel {
            bottomTextLabel.text = viewModel.bottomText
            background.backgroundColor = viewModel.backgroundColor
            arrowImage.image = viewModel.arrowImage
            productImage.image = viewModel.productImage
            textImage.image = viewModel.textImage
            patternImage.image = viewModel.patternImage
            backgroundImage.image = viewModel.backgroundImage
            background.backgroundColor = viewModel.backgroundColor
            containerView.backgroundColor = viewModel.backgroundColor
            bottomTextLabel.textColor = viewModel.bottomTextColor
        }
    }
}
