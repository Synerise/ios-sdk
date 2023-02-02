//
//  TestFlowCoordinator.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class TestCoordinator: Coordinator {
    
    // MARK: - Inherited
    
    override func start() {
        super.start()
        
        let testViewController: TestViewController = TestViewController()
        testViewController.title = "VIEW_CONTROLLER_TEST_TITLE".localized()
        
        configure.router.setRootModule(testViewController, hideNavigationBar: false)
    }
}
