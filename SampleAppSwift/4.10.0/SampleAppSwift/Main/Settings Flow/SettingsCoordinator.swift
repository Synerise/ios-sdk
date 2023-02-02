//
//  SettingsCoordinator.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    // MARK: - Inherited
    
    override func start() {
        super.start()
        
        let settingsViewController: SettingsViewController = SettingsViewController()
        settingsViewController.settingsService = self.applicationController.serviceProvider.getSettingsService()
        settingsViewController.title = "VIEW_CONTROLLER_SETTINGS_TITLE".localized()
        
        configure.router.setRootModule(settingsViewController, hideNavigationBar: false)
    }
}
