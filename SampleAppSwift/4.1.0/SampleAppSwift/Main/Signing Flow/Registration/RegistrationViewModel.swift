//
//  RegistrationViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

protocol RegistrationViewModelDelegate: class {
    func userRegistrationSuccess(_ registrationViewModel: RegistrationViewModel, response: Any)
    func userRegistrationError(_ registrationViewModel: RegistrationViewModel, error: Error)
}

class RegistrationViewModel {

    var coordinator: SigningCoordinator?
    weak var delegate: RegistrationViewModelDelegate?

    var userRegistrationFormViewModel: UserRegistrationFormViewModel = {
        var firstName = ""
        var lastName = ""
        var login = ""
        var password = ""
        var registrationType = UserRegistrationFormViewModel.RegistrationType.email

        let userRegistrationFormViewModel = UserRegistrationFormViewModel(firstName: firstName, lastName: lastName, login: login, password: password, registrationType: registrationType)

        return userRegistrationFormViewModel
    }()

    // MARK: - Init

    init() {
        setup()
    }

    // MARK: - Public

    func userDidRegister() {
        coordinator?.userDidRegister()
    }

    // MARK: - Private

    private func setup() {
        userRegistrationFormViewModel.invokeOnSuccess { response in
            self.delegate?.userRegistrationSuccess(self, response: response)
        }

        userRegistrationFormViewModel.invokeOnError { error in
            self.delegate?.userRegistrationError(self, error: error)
        }
    }
}
