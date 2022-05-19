//
//  SigningCoordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class SigningCoordinator: Coordinator {

    // MARK: - Inherited

    override func start() {
        super.start()
        
        startWithLogin()
    }

    // MARK: - Public

    func startWithRegistration() {
        super.start()

        let registrationViewController: RegistrationViewController = makeRegistrationViewController()
        configure.router.setRootModule(registrationViewController, hideNavigationBar: false)
    }

    func startWithLogin() {
        super.start()

        let loginViewController: LoginViewController = makeLoginViewController()
        configure.router.setRootModule(loginViewController, hideNavigationBar: false)
    }

    func userDidLogin() {
        let mainCoordinator: MainCoordinator = self.applicationController.getMainCoordinator()
        mainCoordinator.userSignedIn()
    }
    
    func userDidRegister() {
        let mainCoordinator: MainCoordinator = self.applicationController.getMainCoordinator()
        mainCoordinator.userSignedUp()
    }

    func navigateToLogin() {
        startWithLogin()
    }
    
    func navigateToRegistration() {
        startWithRegistration()
    }

    // MARK: - Private

    private func makeRegistrationViewController() -> RegistrationViewController {

        let viewModel: RegistrationViewModel = RegistrationViewModel()
        viewModel.coordinator = self

        let viewController: RegistrationViewController = RegistrationViewController()
        viewController.viewModel = viewModel
        viewController.title = "VIEW_CONTROLLER_REGISTRATION_TITLE".localized()

        return viewController
    }

    private func makeLoginViewController() -> LoginViewController {

        let viewModel: LoginViewModel = LoginViewModel()
        viewModel.coordinator = self

        let viewController: LoginViewController = LoginViewController()
        viewController.viewModel = viewModel
        viewController.title = "VIEW_CONTROLLER_LOGIN_TITLE".localized()

        return viewController
    }
}
