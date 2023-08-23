//
//  ProfileCoordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    // MARK: - Inherited
    
    override func start() {
        super.start()
        
        let dashboardViewController: ProfileViewController = makeMyProfileViewController()
        configure.router.setRootModule(dashboardViewController, hideNavigationBar: false)
    }
    
    // MARK: - Private
    
    private func makeMyProfileViewController() -> ProfileViewController {
        let viewModel: ProfileViewModel = ProfileViewModel()
        viewModel.coordinator = self
        
        let viewController: ProfileViewController = ProfileViewController()
        viewController.viewModel = viewModel
        viewController.title = "VIEW_CONTROLLER_MY_PROFILE_TITLE".localized()
        
        return viewController
    }
    
    // MARK: - Public
    
    func clientDataWasUpdated() {
        
    }
}
