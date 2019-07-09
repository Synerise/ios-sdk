//
//  MainCoordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

struct MainCoordinatorNotifications {
    static let showLeftMenu = Notification.Name(rawValue: "MainCoordinatorNotificationsShowLeftMenu")
    static let hideLeftMenu = Notification.Name(rawValue: "MainCoordinatorNotificationsHideLeftMenu")
    static let showCart = Notification.Name(rawValue: "MainCoordinatorNotificationsShowCart")
}

class MainCoordinator: Coordinator {
    
    var mainRouter: RouterType = {
        let router = Router(UINavigationController(navigationBarClass: DefaultNavigationBar.self, toolbarClass: nil))
        router.navigationBarVisible = true

        return router
    }()

    lazy var mainViewController: MainViewController = {
        return MainViewController()
    }()

    lazy var leftMenuViewController: LeftMenuViewController = {
        let viewController = LeftMenuViewController()
        
        let viewModel = LeftMenuViewModel()
        viewModel.coordinator = self
        viewModel.settingsService = applicationController.serviceProvider.getSettingsService()

        viewController.viewModel = viewModel
        
        return viewController
    }()
    
    // MARK: - Deinit

    deinit {
       NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Init

    override init() {
        super.init()

        startObserving()
    }

    // MARK: - Public
    
    func didReceiveDeeplinkWithSku(_ sku: String) {
        showShopFlowWithProductBySku(sku)
    }
    
    func userSignedUp() {
        showLoginFlow()
    }
    
    func userSignedIn() {
        showShopFlow()
    }
    
    func userSignedOut() {
        UserInfoMessageManager.shared.success("You are signed out!", nil)
        showLoginFlow()
    }
    
    func leftMenuItemDidSelect(_ identity: LeftMenuItemIdentity) {
        mainViewController.hideMenu()

        switch identity {
        case .dashboard:
            showShopFlow()
        case .profile:
            showProfileFlow()
        case .shop:
            showShopFlow()
        case .promotions:
            showPromotionsFlow()
        case .vouchers:
            showVouchersFlow()
        case .cart:
            showCheckoutFlow()
        case .developerTools:
            showDeveloperToolsFlow()
        case .registration:
            showRegistrationFlow()
        case .login:
            showLoginFlow()
        case .logout:
            executeLogout()
        case .settings:
            showSettingsFlow()
        case .test:
            showTestFlow()
        }
    }

    // MARK: - Inherited

    override func start() {
        super.start()

        let leftMenuViewController: LeftMenuViewController = self.leftMenuViewController
        let centerNavigationController: UINavigationController = mainRouter.navigationController

        let mainViewController: MainViewController = self.mainViewController
        mainViewController.leftMenuViewController = leftMenuViewController
        mainViewController.centerNavigationViewController = centerNavigationController

        resolveFlow()

        configure.router.setRootModule(mainViewController, hideNavigationBar: true)
    }

    override func finish() {
        super.finish()
    }

    // MARK: - Private

    private func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(showLeftMenu), name: MainCoordinatorNotifications.showLeftMenu, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideLeftMenu), name: MainCoordinatorNotifications.hideLeftMenu, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showCart), name: MainCoordinatorNotifications.showCart, object: nil)
    }

    @objc private func showLeftMenu() {
        let syneriseManager: SyneriseManager = self.applicationController.syneriseManager
        let isSignedIn: Bool = syneriseManager.isSignedIn()
        
        if isSignedIn {
            leftMenuViewController.viewModel.state = .userLogged
        } else {
            leftMenuViewController.viewModel.state = .userNotLogged
        }
        
        mainViewController.showMenu()
    }

    @objc private func hideLeftMenu() {
        mainViewController.hideMenu()
    }
    
    @objc private func showCart() {
        showCheckoutFlow()
    }

    private func resolveFlow() {
        showShopFlow()
    }

    private func showShopFlow() {
        let shopCoordinator: ShopCoordinator = ShopCoordinator()
        shopCoordinator.applicationController = self.applicationController
        shopCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        shopCoordinator.startWithSections()
    }
    
    private func showPromotionsFlow() {
        let shopCoordinator: ShopCoordinator = ShopCoordinator()
        shopCoordinator.applicationController = self.applicationController
        shopCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        shopCoordinator.startWithPromotionsProducts()
    }
    
    private func showShopFlowWithProductBySku(_ sku: String) {
        let shopCoordinator: ShopCoordinator = ShopCoordinator()
        shopCoordinator.applicationController = self.applicationController
        shopCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        shopCoordinator.startWithProductSku(sku: sku)
    }

    private func showProfileFlow() {
        let profileCoordinator: ProfileCoordinator = ProfileCoordinator()
        profileCoordinator.applicationController = self.applicationController
        profileCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        profileCoordinator.start()
    }

    private func showCheckoutFlow() {
        let checkoutCoordinator: CheckoutCoordinator = CheckoutCoordinator()
        checkoutCoordinator.applicationController = self.applicationController
        checkoutCoordinator.configure = CoordinatorConfigure(parentCoordinator: nil, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        checkoutCoordinator.start()
    }
    
    private func showVouchersFlow() {
        let checkoutCoordinator: CheckoutCoordinator = CheckoutCoordinator()
        checkoutCoordinator.applicationController = self.applicationController
        checkoutCoordinator.configure = CoordinatorConfigure(parentCoordinator: nil, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        checkoutCoordinator.startWithVouchers()
    }

    private func showDeveloperToolsFlow() {
        let developerToolsCoordinator: DeveloperToolsCoordinator = DeveloperToolsCoordinator()
        developerToolsCoordinator.applicationController = self.applicationController
        developerToolsCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        developerToolsCoordinator.start()
    }

    private func showRegistrationFlow() {
        let signingCoordinator: SigningCoordinator = SigningCoordinator()
        signingCoordinator.applicationController = self.applicationController
        signingCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        signingCoordinator.startWithRegistration()
    }

    private func showLoginFlow() {
        let signingCoordinator: SigningCoordinator = SigningCoordinator()
        signingCoordinator.applicationController = self.applicationController
        signingCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        signingCoordinator.startWithLogin()
    }
    
    private func showSettingsFlow() {
        let settingsCoordinator: SettingsCoordinator = SettingsCoordinator()
        settingsCoordinator.applicationController = self.applicationController
        settingsCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        settingsCoordinator.start()
    }
    
    private func showTestFlow() {
        let testCoordinator: TestCoordinator = TestCoordinator()
        testCoordinator.applicationController = self.applicationController
        testCoordinator.configure = CoordinatorConfigure(parentCoordinator: self, childCoordinators: applicationController.childCoordinators, router: mainRouter)
        testCoordinator.start()
    }

    private func executeLogout() {  
        let syneriseManager: SyneriseManager = self.applicationController.syneriseManager
        syneriseManager.signOut()
        
        LoginManager().logOut()
        
        self.userSignedOut()
    }
}
