//
//  CheckoutViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CheckoutViewModel {
    
    var coordinator: CheckoutCoordinator?
    var sections: [CartSection] = [CartSection]()
    
    var selectedShippingMethod = 0 {
        didSet {
            loadSections()
        }
    }
    var selectedPaymentMethod = 0 {
        didSet {
            loadSections()
        }
    }
    
    var voucherCode: String {
        guard
            let voucherSection = self.sections[1].rows[0] as? CheckoutVoucherTableViewModel,
            let voucherCode = voucherSection.voucherCode.value else {
            return ""
        }
        
        return voucherCode
    }
    
    init() {
        loadSections()
    }
    
    // MARK: - Public
    
    func getTitleForSection(_ sectionNumber: Int) -> String {
        return sections[sectionNumber].title
    }
    
    func getNumberOfSections() -> Int {
        return sections.count
    }
    
    func getNumberOfRowsInSection(_ sectionNumber: Int) -> Int {
        return sections[sectionNumber].rows.count
    }
    
    func removeCartItem(row: Int) {
        CartManager.shared.removeProduct(row: row)
    }
    
    // MARK: - Private
    
    public func loadSections() {
        let productsSection = getProductsSection()
        let voucherSection = getVoucherSection()
        let shippingDetailsSection = getShippingSection()
        let paymentDetailsSection = getPaymentSection()
        
        self.sections = [productsSection, voucherSection, shippingDetailsSection, paymentDetailsSection]
    }
    
    private func getProductsSection() -> CartSection {
        let productViewModels = getProductViewModels()
        let productsSection = CartSection(title: "Products", rows: productViewModels)
        
        return productsSection
    }
    
    private func getVoucherSection() -> CartSection {
        let productViewModel = CheckoutVoucherTableViewModel()
        let productsSection = CartSection(title: "Voucher", rows: [productViewModel])
        
        return productsSection
    }
    
    private func getShippingSection() -> CartSection {
        var shippingSectionViewModels = [AnyObject]()
        
        let checkoutShipToModel = CheckoutShipToDataSource.getCheckoutShipToModel()
        let checkoutShippingViewModels = getShippingViewModels()
        
        shippingSectionViewModels.append(contentsOf: checkoutShipToModel)
        shippingSectionViewModels.append(contentsOf: checkoutShippingViewModels)
        
        let shippingDetailsSection = CartSection(title: "Shipping Details", rows: shippingSectionViewModels)
        
        return shippingDetailsSection
    }
    
    private func getPaymentSection() -> CartSection {
        let paymentTableViewModels = getPaymentViewModels()
        let paymentDetailsSection = CartSection(title: "Payment details", rows: paymentTableViewModels)
        
        return paymentDetailsSection
    }
    
    private func getProductViewModels() -> [CheckoutProductTableViewModel] {
        let products = CartManager.shared.getCartItems()
        var productViewModels = [CheckoutProductTableViewModel]()
        
        products.forEach { (productModel) in
            let productViewModel = CheckoutProductTableViewModel(cartItem: productModel)
            productViewModels.append(productViewModel)
        }
        
        return productViewModels
    }
    
    private func getShippingViewModels() -> [CheckoutShippingMethodTableViewModel] {
        let checkoutShippingModels = CheckoutShippingMethodsDataSource.getShippingModels()
        var checkoutShippingTableViewModels = [CheckoutShippingMethodTableViewModel]()
        
        checkoutShippingModels.forEach { (checkoutShippingModel) in
            let checkoutShippingTableViewModel = CheckoutShippingMethodTableViewModel(model: checkoutShippingModel)
            checkoutShippingTableViewModels.append(checkoutShippingTableViewModel)
        }
        
        checkoutShippingTableViewModels[selectedShippingMethod].state = true
        
        return checkoutShippingTableViewModels
    }
    
    private func getPaymentViewModels() -> [CheckoutPaymentTableViewModel] {
        let checkoutPaymentModels = CheckoutPaymentDataSource.getCheckoutPaymentModels()
        var paymentTableViewModels = [CheckoutPaymentTableViewModel]()
        
        checkoutPaymentModels.forEach { (checkoutPaymentModel) in
            let paymentViewModel = CheckoutPaymentTableViewModel(model: checkoutPaymentModel)
            paymentTableViewModels.append(paymentViewModel)
        }
        
        paymentTableViewModels[selectedPaymentMethod].state = true
        
        return paymentTableViewModels
    }
}
