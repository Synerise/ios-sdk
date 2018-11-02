//
//  Administrator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import Firebase
import Swinject

class Administrator {
    
    static let assembly: AppAssembly = {
        let assembly: AppAssembly = AppAssembly()
        assembly.configure()

        return assembly
    }()

    static let shared = Administrator.resolve()

    var serviceProvider: ServiceProvider!

    // MARK: - Deinit

    deinit {

    }

    // MARK: - Initializators

    init() {

    }

    // MARK: - Public

    func launched() {
        prepareDefaultSettings()
        setup()
    }

    func getNotificationService() -> NotificationService {
        return serviceProvider.getNotificationService()
    }

    // MARK: - Private

    private func prepareDefaultSettings() {
    
    }

    private func setup() {
        //setupFirebase()
        //registerForNotifications()
    }

    private func setupFirebase() {
        FirebaseApp.configure()
    }

    private func registerForNotifications() {
        let notificationService: NotificationService = serviceProvider.getNotificationService()
        notificationService.setup()
    }
}

extension Administrator: Registerable {
    static func register(inContainer container: Container) {
        container.register(Administrator.self) { _ in
                return Administrator()
        }
        .initCompleted({ (resolver, service) in
            service.serviceProvider = resolver.resolve(ServiceProvider.self)
        })
        .inObjectScope(.container)
    }
}

extension Administrator: Resolvable {
    typealias ObjectType = ServiceProvider

    static func resolve() -> ObjectType {
        return Administrator.assembly.resolve(ServiceProvider.self)!
    }
}
