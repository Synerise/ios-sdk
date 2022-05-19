//
//  Administrator.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import CoreLocation
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
    
    var locationManager = CLLocationManager()
    
    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Initializators
    
    init() {
        
    }
    
    // MARK: - Public
    
    func launched() {
        prepareDefaultSettings()
    }
    
    func setupFirebase() {
        FirebaseApp.configure()
    }
    
    func setupNotifications() {
        let notificationService: NotificationService = self.serviceProvider.getNotificationService()
        notificationService.setup()
    }
    
    func requestLocationServices() {
        locationManager.requestAlwaysAuthorization()
    }
    
    // MARK: - Private
    
    private func prepareDefaultSettings() {
        
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
    typealias ObjectType = Administrator

    static func resolve() -> ObjectType {
        return Administrator.assembly.resolve(Administrator.self)!
    }
}
