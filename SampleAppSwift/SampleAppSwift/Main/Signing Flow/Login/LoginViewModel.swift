//
//  LoginViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import AuthenticationServices
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

protocol LoginViewModelDelegate: class {
    func userLoginSuccess(_ loginViewModel: LoginViewModel, response: Any)
    func userLoginError(_ loginViewModel: LoginViewModel, error: Error)
}

class LoginViewModel {

    var coordinator: SigningCoordinator?
    weak var delegate: LoginViewModelDelegate?

    var userLoginFormViewModel: UserLoginFormViewModel = {
        var login = ""
        var password = ""
        var loginType = UserLoginFormViewModel.LoginType.email
        
        let userLoginFormViewModel = UserLoginFormViewModel(login: login, password: password, loginType: loginType)

        return userLoginFormViewModel
    }()

    // MARK: - Init

    init() {
        setup()
    }

    // MARK: - Public

    func createNewAccount() {
        coordinator?.navigateToRegistration()
    }
    
    func authenticateByFacebookToken(onSuccess: @escaping (() -> ())) {
        guard let facebookToken = AccessToken.current?.tokenString else {
            return
        }
        
        Client.authenticateByFacebookIfRegistered(facebookToken: facebookToken, authID: nil, success: { _ in
            onSuccess()
        }) { (error) in
            let agreements: ClientAgreements = ClientAgreements()
            
            let context: ClientFacebookAuthenticationContext = ClientFacebookAuthenticationContext()
            context.agreements = agreements
            context.attributes = ["param": "value"]

            Client.authenticateByFacebook(facebookToken: facebookToken, authID: nil, context: context, success: { _ in
                onSuccess()
            }, failure: { error in

            })
        }
    }
    
    @available(iOS 13.0, *)
    func authenticateByAppleSignIn(appleIdCredential: ASAuthorizationAppleIDCredential, onSuccess: @escaping (() -> ()), onError: @escaping (() -> ())) {
        guard let identityToken = appleIdCredential.identityToken else {
            return
        }

        Client.authenticateByAppleSignInIfRegistered(identityToken: identityToken, authID: nil, success: { _ in
            onSuccess()
        }) { (error) in
            let agreements: ClientAgreements = ClientAgreements()
            
            let context: ClientAppleSignInAuthenticationContext = ClientAppleSignInAuthenticationContext()
            context.agreements = agreements
            context.attributes = ["param": "value"]

            Client.authenticateByAppleSignIn(identityToken: identityToken, authID: nil, context: context, success: { _ in
                onSuccess()
            }, failure: { error in
                onError()
            })
        }
    }

    // MARK: - Private

    func create() {
        coordinator?.startWithRegistration()
    }

    private func setup() {
        userLoginFormViewModel.invokeOnSuccess { response in
            self.delegate?.userLoginSuccess(self, response: response)
        }

        userLoginFormViewModel.invokeOnError { error in
            self.delegate?.userLoginError(self, error: error)
        }
    }
}
