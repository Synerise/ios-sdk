//
//  ProductDetailsViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ProductViewController: DefaultViewController {
    
    var viewModel: ProductViewModel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var productDetailsView: ProductDetailsView! {
        didSet {
            productDetailsView.setViewModel(viewModel.productDetailsViewModel!)
            productDetailsView.delegate = viewModel.productDetailsViewModel
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareRightCartButton()
    }
}
    
