//
//  CategoryItemTableViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CategoryItemTableViewCell: UITableViewCell, Updatable {
    
    static let reuseIdentifier = "CategoryItemTableViewCell"

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    // MARK: - Updatable
    
    func update<T>(_ object: T) where T: AnyObject {
        if let viewModel = object as? CategoryItemTableViewModel {
            background.backgroundColor = viewModel.backgroundColor
            productName.text = viewModel.title
            productImage.image = viewModel.icon
        }
    }
}
