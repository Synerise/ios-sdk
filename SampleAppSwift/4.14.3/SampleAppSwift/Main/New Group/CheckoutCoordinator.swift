//
//  CheckoutCoordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CheckoutCoordinator: Coordinator {
    
    private var checkoutViewController: CheckoutViewController?
    
    // MARK: - Inherited
    
    override func start() {
        super.start()
        
        setRootViewController()
    }
    
    func startWithVouchers() {
        super.start()
        
        let vouchersViewController: VouchersViewController = makeVouchersViewController()
        configure.router.setRootModule(vouchersViewController, hideNavigationBar: false)
    }
    
    func showCartIsEmptyView() {
        let cartIsEmptyViewController: CartIsEmptyViewController = makeCartIsEmptyViewController()
        configure.router.push(cartIsEmptyViewController, animated: true, completion: nil)
    }
    
    func placeYourOrderButtonWasTapped() {
        let congratulationsViewController: CongratulationsViewController = makeCongratulationsViewController()
    
        congratulationsViewController.onContinueButton = {
            congratulationsViewController.dismiss(animated: true, completion: {
                self.checkoutViewController?.view.endEditing(true)
            })
        }
        
        congratulationsViewController.onTrackOrderButton = {
            CartManager.shared.placeOrder()
            
            congratulationsViewController.dismiss(animated: true, completion: nil)
            self.setRootViewController()
        }
        
        configure.router.present(congratulationsViewController, animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func setRootViewController() {
        if CartManager.shared.isEmpty() {
            let cartIsEmptyViewController = makeCartIsEmptyViewController()
            configure.router.setRootModule(cartIsEmptyViewController, hideNavigationBar: false)
        } else {
            self.checkoutViewController = makeCheckoutViewController()
            guard let checkoutViewController = self.checkoutViewController else { return }
            configure.router.setRootModule(checkoutViewController, hideNavigationBar: false)
        }
    }
    
    private func makeVouchersViewController() -> VouchersViewController {
        let vouchersViewController: VouchersViewController = VouchersViewController()
        vouchersViewController.title = "Vouchers"
        
        return vouchersViewController
    }
    
    private func makeCartIsEmptyViewController() -> CartIsEmptyViewController {
        let cartIsEmptyViewController: CartIsEmptyViewController = CartIsEmptyViewController()
        cartIsEmptyViewController.title = "VIEW_CONTROLLER_CART_TITLE".localized()
        
        return cartIsEmptyViewController
    }
    
    private func makeCheckoutViewController() -> CheckoutViewController {
        let viewModel: CheckoutViewModel = CheckoutViewModel()
        viewModel.coordinator = self
        
        let viewController: CheckoutViewController = CheckoutViewController()
        viewController.viewModel = viewModel
        viewController.title = "VIEW_CONTROLLER_CART_TITLE".localized()
        
        return viewController
    }
    
    private func makeCongratulationsViewController() -> CongratulationsViewController {
        let viewController: CongratulationsViewController = CongratulationsViewController()
        
        viewController.providesPresentationContextTransitionStyle = true
        viewController.definesPresentationContext = true
        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        viewController.title = "VIEW_CONTROLLER_CART_TITLE".localized()
        
        return viewController
    }
}
