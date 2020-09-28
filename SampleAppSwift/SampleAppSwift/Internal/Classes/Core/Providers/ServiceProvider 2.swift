//
//  ServiceProvider.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import Swinject

protocol ServiceProviderType: class {
    func getSettingsService() -> SettingsService
    func getNotificationService() -> NotificationService
}

class ServiceProvider: ServiceProviderType {

    unowned var assembler = Administrator.assembly.assembler

    func getSettingsService() -> SettingsService {
        return SettingsService()
    }

    func getNotificationService() -> NotificationService {
        return NotificationService.resolve()
    }
}

extension ServiceProvider: Registerable {
    static func register(inContainer container: Container) {
        container.register(ServiceProvider.self) { _ in
            return ServiceProvider()
        }
        .inObjectScope(.transient)
    }
}

extension ServiceProvider: Resolvable {
    typealias ObjectType = ServiceProvider

    static func resolve() -> ObjectType {
        return Administrator.assembly.resolve(ServiceProvider.self)!
    }
}
