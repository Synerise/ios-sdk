//
//  DeveloperCoordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

class DeveloperToolsCoordinator: Coordinator {
    
    // MARK: - Inherited
    
    override func start() {
        super.start()
        
        let initialViewController = makeInitialViewController()
        
        self.configure.router.setRootModule(initialViewController, hideNavigationBar: false)
    }
    
    // MARK: - Private
    
    private func makeInitialViewController() -> DefaultViewController {
        let storyboard: UIStoryboard = Storyboards.getDeveloperToolsFlow()
        guard let viewController = StoryboardUtils.instantiateInitialViewController(storyboard: storyboard) as? DefaultViewController else {
            fatalError()
        }
        
        if let developerMenuViewController = viewController as? DeveloperMenuViewController {
            developerMenuViewController.delegate = self
            
            return developerMenuViewController
        }
        
        return viewController
    }
}

extension DeveloperToolsCoordinator: DeveloperMenuViewControllerDelegate {
    func resetApplicationWasPressed(_ developerMenuViewController: DeveloperMenuViewController) {
        self.applicationController.resetApplication()
    }
}
