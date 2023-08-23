//
//  Router.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

protocol RouterModule {
    func toPresent() -> UIViewController
}

protocol RouterType: class {
    var navigationController: UINavigationController { get }
    var navigationBarVisible: Bool { get set}

    var rootViewController: UIViewController? { get }

    func setNavigationBarVisible(_ visible: Bool, animated: Bool)
    
    func setRootModule(_ module: RouterModule, hideNavigationBar: Bool)
    func popToRootModule(animated: Bool)

    func push(_ module: RouterModule, animated: Bool, completion: (() -> Void)?)
    func present(_ module: RouterModule, animated: Bool, completion: (() -> Void)?)

    func pop(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

class Router: NSObject, RouterType {
    
    let navigationController: UINavigationController

    var navigationBarVisible: Bool {
        get {
            return navigationController.isNavigationBarHidden
        }
        set {
            navigationController.isNavigationBarHidden = !(newValue)
        }
    }

    var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }

    var hasRootController: Bool {
        return rootViewController != nil
    }

    private var completions: [UIViewController : () -> Void]

    // MARK: - Initializers

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = false
        self.completions = [:]

        super.init()

        self.navigationController.delegate = self
    }

    // MARK: - Public

    func setNavigationBarVisible(_ visible: Bool, animated: Bool) {
        navigationController.setNavigationBarHidden(!visible, animated: animated)
    }
    
    func setRootModule(_ module: RouterModule, hideNavigationBar: Bool = false) {
        completions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresent()], animated: false)
        navigationController.isNavigationBarHidden = hideNavigationBar
    }

    func popToRootModule(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }

    func push(_ module: RouterModule, animated: Bool = true, completion: (() -> Void)? = nil) {

        let controller = module.toPresent()

        guard controller is UINavigationController == false else {
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }

        navigationController.pushViewController(controller, animated: animated)
    }

    func present(_ module: RouterModule, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(module.toPresent(), animated: animated, completion: completion)
    }

    func pop(animated: Bool = true) {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    // MARK: - Private

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else {
            return
        }

        completion()
        completions.removeValue(forKey: controller)
    }
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
            return
        }

        runCompletion(for: poppedViewController)
    }
}
