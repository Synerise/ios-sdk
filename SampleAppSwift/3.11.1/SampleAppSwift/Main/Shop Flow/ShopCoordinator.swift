//
//  ProductsCoordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class ShopCoordinator: Coordinator {

    // MARK: - Inherited

    override func start() {
        super.start()
    }
    
    // MARK: - Public
    
    func startWithSections() {
        super.start()
        
        let sectionsViewController: SectionsListViewController = makeSectionsViewController()
        
        sectionsViewController.onViewWillAppear = {
            self.configure.router.setNavigationBarVisible(false, animated: true)
        }
        
        sectionsViewController.onViewWillDissapear = {
            self.configure.router.navigationBarVisible = true
        }
        
        configure.router.setRootModule(sectionsViewController, hideNavigationBar: true)
    }
    
    func startWithProductSku(sku: String) {
        startWithSections()
        
        let categories: [Int] = CategoryDataSource.getAllCategoriesIdentifiers()
        
        if let product = ProductDataSource.getProductBySku(sku: sku, fromCategories: categories) {
            let productDetailsViewController: ProductViewController = makeProductViewController(product: product)
            
            configure.router.push(productDetailsViewController, animated: true, completion: nil)
        }
    }
    
    func startWithPromotionsProducts() {
        startWithSections()
        
        let productsViewController: ProductsListViewController = makeProductsViewController(category: CategoryDataSource.getPromotionCategory())
        configure.router.push(productsViewController, animated: true, completion: nil)
    }
    
    func pushToCategories(section: Section) {
        super.start()
        
        let categoryViewController: CategoriesListViewController = makeCategoryViewController(section: section)
        
        configure.router.push(categoryViewController, animated: true, completion: nil)
    }
    
    func pushToProducts(category: Category) {
        super.start()
        
        let productsViewController: ProductsListViewController = makeProductsViewController(category: category)
        configure.router.push(productsViewController, animated: true, completion: nil)
    }
    
    func pushToProductDetails(product: Product) {
        super.start()
        
        let productDetailsViewController: ProductViewController = makeProductViewController(product: product)
        
        configure.router.push(productDetailsViewController, animated: true, completion: nil)
    }
    
    func sectionWasSelected(section: Section) {
        pushToCategories(section: section)
    }
    
    func categoryWasSelected(category: Category) {
        pushToProducts(category: category)
    }
    
    func productWasSelected(product: Product) {
        pushToProductDetails(product: product)
    }
    
    // MARK: - Private
    
    private func makeSectionsViewController() -> SectionsListViewController {
        let viewModel: SectionsListViewModel = SectionsListViewModel()
        viewModel.coordinator = self
        
        let viewController: SectionsListViewController = SectionsListViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    private func makeCategoryViewController(section: Section) -> CategoriesListViewController {
        
        let viewModel: CategoriesListViewModel = CategoriesListViewModel(section: section)
        viewModel.coordinator = self
        
        let viewController: CategoriesListViewController = CategoriesListViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    private func makeProductsViewController(category: Category) -> ProductsListViewController {
        let viewModel: ProductsListViewModel = ProductsListViewModel(category: category)
        viewModel.coordinator = self
        
        let configure: ProductsListViewControllerConfigure = ProductsListViewControllerConfigure(
            itemsInRow: DeviceInfoUtils.isIpad() ? 3 : 2
        )
        
        let viewController: ProductsListViewController = ProductsListViewController()
        viewController.viewModel = viewModel
        viewController.configure = configure
        viewController.title = category.title
        
        return viewController
    }
    
    private func makeProductViewController(product: Product) -> ProductViewController {
        let viewModel: ProductViewModel = ProductViewModel(product: product)
        viewModel.coordinator = self
        
        let viewController: ProductViewController = ProductViewController()
        viewController.viewModel = viewModel
        viewController.title = product.name
        
        return viewController
    }
}
