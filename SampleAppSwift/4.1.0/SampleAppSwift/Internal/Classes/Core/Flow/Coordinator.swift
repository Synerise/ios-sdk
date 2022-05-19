//
//  Coordinator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorType: class {
    func start()
    func finish()
}

struct CoordinatorConfigure {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]!
    var router: RouterType!
}

class Coordinator: CoordinatorType {
    
    var applicationController: ApplicationController!
    var configure: CoordinatorConfigure!
    
    var onStart: (() -> Void)?
    var onFinish: (() -> Void)?

    deinit {
        DebugUtils.print("--> COORDINATOR DEINIT: \(self)")
    }

    func start() {
        DebugUtils.print("--> COORDINATOR START: \(self)")
        applicationController.addDependency(self)
        onStart?()
    }

    func finish() {
        DebugUtils.print("--> COORDINATOR FINISH: \(self)")
        onFinish?()
        applicationController.removeDependency(self)
    }
}

protocol HandleSegueDelegate: class {
    func handleSegue(segue: UIStoryboardSegue)
}

protocol CoordinationDelegate: class {
    func prepareForSegue(segue: UIStoryboardSegue)
}

protocol Coordinated {
    var coordinationDelegate: CoordinationDelegate? { get set }
}
