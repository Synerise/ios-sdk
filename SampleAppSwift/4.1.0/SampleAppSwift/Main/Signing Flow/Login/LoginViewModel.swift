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
    
    func authenticateByFacebookToken(onSuccess: @escaping (() -> ()), onError: @escaping ((Error) -> ())) {
        guard let facebookToken = AccessToken.current?.tokenString else {
            onError(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "There is no active Facebook token!"
            ]))
            return
        }
        
        let agreements: ClientAgreements = ClientAgreements()
        let context: ClientConditionalAuthenticationContext = ClientConditionalAuthenticationContext()
        context.agreements = agreements
        context.attributes = ["param": "value"]
        
        Client.authenticateConditionally(token: facebookToken, clientIdentityProvider: .facebook, authID: nil, context: context) { authResult in
            if authResult.status == .success {
                onSuccess()
                return
            } else if authResult.status == .registrationRequired {
                let agreements: ClientAgreements = ClientAgreements()
                let context: ClientAuthenticationContext = ClientAuthenticationContext()
                context.agreements = agreements
                context.attributes = ["param": "value"]
                
                Client.authenticate(token: facebookToken, clientIdentityProvider: .facebook, authID: nil, context: context, success: { isSuccess in
                    onSuccess()
                }) { (error) in
                    onError(error)
                }
            } else {
                onError(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                    NSLocalizedDescriptionKey: "Status \(SNR_ClientConditionalAuthStatusToString(authResult.status)) is not supported!"
                ]))
            }
        } failure: { error in
            onError(error)
        }
    }
    
    @available(iOS 13.0, *)
    func authenticateByAppleSignIn(appleIdCredential: ASAuthorizationAppleIDCredential, onSuccess: @escaping (() -> ()), onError: @escaping ((Error) -> ())) {
        guard let identityToken = appleIdCredential.identityToken else {
            onError(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "There is no active Apple Sign In token!"
            ]))
            return
        }
        
        let agreements: ClientAgreements = ClientAgreements()
        let context: ClientConditionalAuthenticationContext = ClientConditionalAuthenticationContext()
        context.agreements = agreements
        context.attributes = ["param": "value"]
        
        Client.authenticateConditionally(token: identityToken, clientIdentityProvider: .apple, authID: nil, context: context) { authResult in
            if authResult.status == .success {
                onSuccess()
                return
            } else if authResult.status == .registrationRequired {
                let agreements: ClientAgreements = ClientAgreements()
                let context: ClientAuthenticationContext = ClientAuthenticationContext()
                context.agreements = agreements
                context.attributes = ["param": "value"]
                
                Client.authenticate(token: identityToken, clientIdentityProvider: .apple, authID: nil, context: context, success: { isSuccess in
                    onSuccess()
                }) { (error) in
                    onError(error)
                }
            } else {
                onError(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                    NSLocalizedDescriptionKey: "Status \(SNR_ClientConditionalAuthStatusToString(authResult.status)) is not supported!"
                ]))
            }
        } failure: { error in
            onError(error)
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
