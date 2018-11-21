//
//  UserLoginFormViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

typealias UserLoginSuccess = ((_ response: Any) -> Void)
typealias UserLoginError = ((_ error: Error) -> Void)

class UserLoginFormViewModel {

    enum LoginType: Int {
        case email = 0
    }

    var isProcessing: ObservingType<Bool> = ObservingType.init(false)

    var loginType: BindingType<Int>
    var login: BindingType<String>
    var password: BindingType<String>

    private var onSuccessClosures: [UserLoginSuccess] = [UserLoginSuccess]()
    private var onErrorClosures: [UserLoginError] = [UserLoginError]()

    // MARK: - Init

    init() {
        self.loginType = BindingType<Int>.init(LoginType.email.rawValue)
        self.login = BindingType<String>.init("")
        self.password = BindingType<String>.init("")
    }

    init(login: String, password: String, loginType: LoginType) {
        self.loginType = BindingType<Int>.init(loginType.rawValue)
        self.login = BindingType<String>.init(login)
        self.password = BindingType<String>.init(password)
    }

    // MARK: - Public

    func invokeOnSuccess(_ closure: @escaping UserLoginSuccess) {
        onSuccessClosures.append(closure)
    }

    func invokeOnError(_ closure: @escaping UserLoginError) {
        onErrorClosures.append(closure)
    }

    func isValid() -> Bool {
        return validate()
    }

    // MARK: - Private

    private func validate() -> Bool {
        return true
    }

    private func executeLogin() {
        isProcessing(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let isValid = self.validate()

            guard isValid else {
                return
            }

            guard let registrationTypeRawValue = self.loginType.value, let loginType = LoginType.init(rawValue: registrationTypeRawValue) else {
                return
            }

            guard let login = self.login.value, let password = self.password.value else {
                return
            }

            self.chooseLoginType(loginType: loginType, login: login, password: password)
        }
    }

    private func chooseLoginType(loginType: LoginType, login: String, password: String) {
        switch loginType {
        case .email:
            loginWithEmail(email: login, password: password)
        }
    }

    private func loginWithEmail(email: String, password: String) {
        do {
            try SNRExceptionHandler.catchException {
                Client.signIn(email: email, password: password, deviceId: nil, success: { (success) in
                    DispatchQueue.main.async {
                        self.loginSuccess(response: success)
                    }
                }, failure: { (error) in
                    DispatchQueue.main.async {
                        self.loginError(error: error)
                    }
                })
            }
        } catch let error as NSError {
            self.loginError(error: error)
        }
    }

    private func isProcessing(_ boolean: Bool) {
        isProcessing.value = boolean
    }

    private func loginSuccess(response: Any) {
        isProcessing(false)
        
        guard !onSuccessClosures.isEmpty else {
            return
        }

        onSuccessClosures.forEach { closure in
            closure(response)
        }
    }

    private func loginError(error: Error) {
        isProcessing(false)
        
        guard onErrorClosures.isEmpty == false else {
            return
        }

        onErrorClosures.forEach { closure in
            closure(error)
        }
    }
}

extension UserLoginFormViewModel: UserLoginFormViewDelegate {
    func signInButtonWasClicked(_ userLoginFormView: UserLoginFormView, _ sender: UIButton) {
        executeLogin()
    }
}
