//
//  UserRegistrationFormViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

typealias UserRegistrationSuccess = ((_ response: Any) -> Void)
typealias UserRegistrationError = ((_ error: Error) -> Void)

class UserRegistrationFormViewModel {

    enum RegistrationType: Int {
        case email = 0
        case phone = 1
    }

    var isProcessing: ObservingType<Bool> = ObservingType.init(false)

    var registrationType: BindingType<Int>
    var firstName: BindingType<String>
    var lastName: BindingType<String>
    var login: BindingType<String>
    var password: BindingType<String>

    private var onSuccessClosures: [UserRegistrationSuccess] = [UserRegistrationSuccess]()
    private var onErrorClosures: [UserRegistrationError] = [UserRegistrationError]()

    // MARK: - Init

    init() {
        self.registrationType = BindingType<Int>.init(RegistrationType.email.rawValue)
        self.firstName = BindingType<String>.init("")
        self.lastName = BindingType<String>.init("")
        self.login = BindingType<String>.init("")
        self.password = BindingType<String>.init("")
    }

    init(firstName: String, lastName: String, login: String, password: String, registrationType: RegistrationType) {
        self.registrationType = BindingType<Int>.init(registrationType.rawValue)
        self.firstName = BindingType<String>.init(firstName)
        self.lastName = BindingType<String>.init(lastName)
        self.login = BindingType<String>.init(login)
        self.password = BindingType<String>.init(password)
    }

    // MARK: - Public

    func invokeOnSuccess(_ closure: @escaping UserRegistrationSuccess) {
        onSuccessClosures.append(closure)
    }

    func invokeOnError(_ closure: @escaping UserRegistrationError) {
        onErrorClosures.append(closure)
    }

    func isValid() -> Bool {
        return validate()
    }

    // MARK: - Private

    private func validate() -> Bool {
        return true
    }

    private func executeRegister() {
        isProcessing(true)
    
            guard isValid() else {
                return
            }

            do {
                if let registerClientContext = try self.makeRegisterClientContext() {
                    Profile.registerClient(registerClientContext, success: { (success) in
                        DispatchQueue.main.async {
                            self.registrationSuccess(response: success)
                        }
                    }, failure: { (error) in
                        DispatchQueue.main.async {
                            self.registrationError(error: error)
                        }
                    })
                }
            } catch {
                self.registrationError(error: error)
            }
    }

    private func isProcessing(_ boolean: Bool) {
        isProcessing.value = boolean
    }

    private func makeRegisterClientContext() throws -> RegisterClientContext? {
        guard let registrationTypeRawValue = registrationType.value, let registrationType = RegistrationType.init(rawValue: registrationTypeRawValue) else {
            return nil
        }

        guard let login = login.value, let password = password.value else {
            return nil
        }

        var registerClientContext: RegisterClientContext!

        do {
            try SNRExceptionHandler.catchException {
                switch registrationType {
                case .email: registerClientContext = RegisterClientContext.init(login, password: password)
                case .phone: registerClientContext = RegisterClientContext.init(phoneNumber: login, password: password)
                }

                let agreements: ClientAgreements = ClientAgreements()
                agreements.email = true
                agreements.sms = true
                agreements.push = true
                agreements.bluetooth = true
                agreements.rfid = true
                agreements.wifi = true
                
                registerClientContext.agreements = agreements

                if let firstname = self.firstName.value {
                    registerClientContext.firstName = firstname
                }

                if let lastName = self.lastName.value {
                    registerClientContext.lastName = lastName
                }
            }
        } catch let error as NSError {
            throw error
        }

        return registerClientContext
    }

    private func registrationSuccess(response: Any) {
        isProcessing(false)
        
        guard !onSuccessClosures.isEmpty else {
            return
        }

        onSuccessClosures.forEach { closure in
            closure(response)
        }
    }

    private func registrationError(error: Error) {
        isProcessing(false)
        
        guard onErrorClosures.isEmpty == false else {
            return
        }

        onErrorClosures.forEach { closure in
            closure(error)
        }
    }
}

extension UserRegistrationFormViewModel: UserRegistrationFormViewDelegate {
    func signUpButtonWasClicked(_ userRegistrationFormView: UserRegistrationFormView, _ sender: UIButton) {
        executeRegister()
    }
}
