//
//  ApplicationController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import SyneriseSDK

class ApplicationController {
    
    var administrator: Administrator!
    
    var serviceProvider: ServiceProvider!
    var syneriseManager: SyneriseManager!
    
    var appRouter: RouterType = {
        let router = Router(UINavigationController(navigationBarClass: DefaultNavigationBar.self, toolbarClass: nil))
        router.navigationBarVisible = false
        
        return router
    }()
    
    var childCoordinators = [Coordinator]()
    
    // MARK: - Public
    
    func run() {
        administrator.launched()
        
        resolveFlow()
        makeKeyAndVisible()
    }
    
    func initializeSyneriseSDK() {
        syneriseManager = SyneriseManager.resolve()
        syneriseManager.initialize()
        syneriseManager.setSyneriseDelegate(self)
        
        let notificationService: NotificationService = serviceProvider.getNotificationService()
        notificationService.addDelegate(syneriseManager)
    }
    
    func addDependency(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else {
            return
        }
        
        //FIX ME: check
        for (index, childCoordinator) in childCoordinators.enumerated().reversed() where childCoordinator === coordinator {
            childCoordinators.remove(at: index)
        }
    }
    
    func getMainCoordinator() -> MainCoordinator! {
        for (_, childCoordinator) in childCoordinators.enumerated().reversed() {
            if let mainCoordinator = childCoordinator as? MainCoordinator {
                return mainCoordinator
            }
        }
        
        fatalError()
    }
    
    // MARK: - Private
    
    private func keysAreEmpty() -> Bool {
        let settingsService = serviceProvider.getSettingsService()
        if let syneriseClientAPI: String = settingsService.get(SettingsServiceKey.syneriseClientAPIKey), !syneriseClientAPI.isEmpty {
                return false
        }
        
        return true
    }
    
    private func resolveFlow() {
        if keysAreEmpty() {
            showCongigurationFlow()
        } else {
            initializeSyneriseSDK()
            showMainFlow()
        }
    }
    
    private func showMainFlow() {
        administrator.requestLocationServices()
        
        let mainCoordinator: MainCoordinator = MainCoordinator()
        mainCoordinator.applicationController = self
        mainCoordinator.configure = CoordinatorConfigure(parentCoordinator: nil, childCoordinators: childCoordinators, router: appRouter)
        mainCoordinator.start()
    }
    
    private func showCongigurationFlow() {
        let configurationCoordinator: ConfigurationCoordinator = ConfigurationCoordinator()
        configurationCoordinator.applicationController = self
        
        configurationCoordinator.didFinish = { [unowned self] in
            self.resolveFlow()
        }
        
        configurationCoordinator.configure = CoordinatorConfigure(parentCoordinator: nil, childCoordinators: childCoordinators, router: appRouter)
        configurationCoordinator.start()
    }
    
    private func makeKeyAndVisible() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = appRouter.navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
}

extension ApplicationController: Registerable {
    static func register(inContainer container: Container) {
        container.register(ApplicationController.self) { _ in
            return ApplicationController()
            }
            .initCompleted({ (resolver, service) in
                service.administrator = resolver.resolve(Administrator.self)
                service.serviceProvider = resolver.resolve(ServiceProvider.self)
            })
            .inObjectScope(.container)
    }
}

extension ApplicationController: Resolvable {
    typealias ObjectType = ApplicationController
    
    static func resolve() -> ObjectType {
        return Administrator.assembly.resolve(ApplicationController.self)!
    }
}

extension ApplicationController: SyneriseDelegate {
    func snr_handledAction(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func snr_handledAction(deepLink: String) {
        if let url = URL(string: deepLink) {
            url.params?.forEach({ (key, value) in
                if key == "sku" {
                    self.getMainCoordinator()?.didReceiveDeeplinkWithSku(value)
                }
            })
        }
    }
}
