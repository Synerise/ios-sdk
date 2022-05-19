//
//  Assembler.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import Swinject

protocol Registerable {
    static func register(inContainer container: Container)
}

protocol Resolvable {
    associatedtype ObjectType

    static func resolve() -> ObjectType
}

typealias AssemblyObject = Registerable & Resolvable

class AppAssembly {

    static let container: Container = Container()

    let assembler: Assembler = Assembler(container: AppAssembly.container)

    let classes: [Registerable.Type] = [
        Administrator.self,
        ApplicationController.self,
        ServiceProvider.self,
        NotificationService.self,
        SyneriseManager.self
    ]

    func configure() {
        guard classes.isEmpty == false
            else { return }

        classes.forEach { (object) in
            object.register(inContainer: AppAssembly.container)
        }
    }

    func resolve<T>(_ object: T.Type) -> T? {
        return assembler.resolver.resolve(object)
    }
}
