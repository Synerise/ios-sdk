//
//  ConfigurationCoordinator.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ConfigurationCoordinator: Coordinator {
    
    var didFinish: (() -> Void)?
    
    // MARK: - Inherited
    
    override func start() {
        super.start()
        
        let configurationViewController: ConfigurationViewController = makeConfigurationViewController()
        configure.router.setRootModule(configurationViewController, hideNavigationBar: false)
    }
    
    // MARK: - Private
    
    private func makeConfigurationViewController() -> ConfigurationViewController {
        let viewModel: ConfigurationViewModel = ConfigurationViewModel()
        viewModel.coordinator = self
        
        viewModel.onFinishButton = { [unowned self] in
            self.didFinish?()
        }
        
        let viewController: ConfigurationViewController = ConfigurationViewController()
        viewController.title = "VIEW_CONTROLLER_CONFIGURATION_TITLE".localized()
        viewController.viewModel = viewModel
        
        return viewController
    }
}
