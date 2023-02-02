//
//  LoginViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import AuthenticationServices
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: DefaultViewController {

    var viewModel: LoginViewModel! {
        didSet {
            viewModel.delegate = self

            viewModel.userLoginFormViewModel.isProcessing.valueChanged = { isProcessing in
                if isProcessing {
                    self.showLoading()
                } else {
                    self.hideLoading()
                }
            }
        }
    }

    @IBOutlet weak var userLoginFormView: UserLoginFormView! {
        didSet {
            userLoginFormView.setViewModel(viewModel.userLoginFormViewModel)
            userLoginFormView.delegate = viewModel.userLoginFormViewModel
        }
    }
    
    @IBOutlet weak var facebookLoginContainerView: UIView!
    @IBOutlet weak var appleSignInContainerView: UIView!

    // MARK: - IBAction

    @IBAction func createNewAccountButtonWasClicked(_ sender: UIButton) {
        viewModel.createNewAccount()
    }
    
    @IBAction func authByFacebookWasClicked(_ sender: UIButton) {
        showLoading()
        
        viewModel.authenticateByFacebookToken {
            self.hideLoading()
            
            UserInfoMessageManager.shared.success("You are signed in!", nil)
            self.viewModel.coordinator?.userDidLogin()
        } onError: { error in
            self.hideLoading()
            
            self.showErrorInfo(error as NSError)
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLeftMenuButton()
        prepareFacebookLoginButton()
        
        if #available(iOS 13.0, *) {
            prepareAppleSignInButton()
        } else {
            appleSignInContainerView.removeFromSuperview()
            appleSignInContainerView = nil
        }
        
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Private

    private func prepareFacebookLoginButton() {
        let loginButton = FBLoginButton()
        self.facebookLoginContainerView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: facebookLoginContainerView.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: facebookLoginContainerView.topAnchor, constant: 20).isActive = true
    }
    
    @available(iOS 13.0, *)
    private func prepareAppleSignInButton() {
        let appleSignInButton = ASAuthorizationAppleIDButton()
        appleSignInButton.addTarget(self, action: #selector(appleSignInTapped), for: .touchUpInside)
        
        self.appleSignInContainerView.addSubview(appleSignInButton)
        
        appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        appleSignInButton.centerXAnchor.constraint(equalTo: facebookLoginContainerView.centerXAnchor).isActive = true
        appleSignInButton.topAnchor.constraint(equalTo: self.appleSignInContainerView.topAnchor, constant: 20).isActive = true
    }
    
    @available(iOS 13.0, *)
    @objc func appleSignInTapped() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        
        request.requestedScopes = [.fullName, .email]

        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.presentationContextProvider = self
        authController.delegate = self
        authController.performRequests()
    }
    
    private func handleSigningSuccess(_ response: Any) {
        UserInfoMessageManager.shared.success("You are signed in!", nil)
        self.viewModel.coordinator?.userDidLogin()
    }

    private func handleSigningError(_ error: Error) {
        self.showErrorInfo(error as NSError)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func userLoginSuccess(_ loginViewModel: LoginViewModel, response: Any) {
        handleSigningSuccess(response)
    }

    func userLoginError(_ loginViewModel: LoginViewModel, error: Error) {
        handleSigningError(error)
    }
}

@available(iOS 13.0, *)
extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

@available(iOS 13.0, *)
extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        guard let error = error as? ASAuthorizationError else {
            return
        }

        switch error.code {
        case .canceled:
            // user press "cancel" during the login prompt
            print("Canceled")
        case .unknown:
            // user didn't login their Apple ID on the device
            print("Unknown")
        case .invalidResponse:
            // invalid response received from the login
            print("Invalid Respone")
        case .notHandled:
            // authorization request not handled, maybe internet failure during login
            print("Not handled")
        case .failed:
            // authorization failed
            print("Failed")
        @unknown default:
            print("Default")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            showLoading()
            
            viewModel.authenticateByAppleSignIn(appleIdCredential: appleIDCredential, onSuccess: {
                self.hideLoading()
                
                UserInfoMessageManager.shared.success("You are signed in!", nil)
                self.viewModel.coordinator?.userDidLogin()
            }, onError: { error in
                self.hideLoading()
                
                self.showErrorInfo(error as NSError)
            })
        }
    }
}
