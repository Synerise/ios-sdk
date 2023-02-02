//
//  ProductsListViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

struct ProductsListViewControllerConfigure {
    let itemsInRow: Int
}

class ProductsListViewController: DefaultViewController {
    
    var viewModel: ProductsListViewModel! {
        didSet {
            self.viewModel.isLoading.valueChanged = { isLoading in
                if isLoading {
                    self.showLoading()
                } else {
                    self.hideLoading()
                }
            }
            
            self.viewModel.onUpdateRequired = {
                self.reloadItems()
            }
            
            self.viewModel.fetchProducts()
        }
    }
    
    var configure: ProductsListViewControllerConfigure!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareRightCartButton()
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ProductItemCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: ProductItemCollectionViewCell.reuseIdentifier)
    }
    
    private func reloadItems() {
        guard let collectionView = self.collectionView else {
            return
        }
        
        if viewModel.numberOfItems() == 0 {
            showInformationView(text: "There are no items here.")
            return
        }
        
        hideInformationView()
        collectionView.reloadData()
    }
}

extension ProductsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItemCollectionViewCell.reuseIdentifier, for: indexPath) as? ProductItemCollectionViewCell else {
            fatalError("Cannot dequeue cell")
        }
        let index = indexPath.row
        let itemViewModel = viewModel.getItemViewModel(index: index)
        cell.update(itemViewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Int(collectionView.frame.size.width) / self.configure.itemsInRow)
        let height = width

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        viewModel.productWasSelected(index: index)
    }
}
