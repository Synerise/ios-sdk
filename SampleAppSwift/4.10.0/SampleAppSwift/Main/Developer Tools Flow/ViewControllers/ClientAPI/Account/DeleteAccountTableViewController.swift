//
//  DeleteAccountTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import AuthenticationServices
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

class DeleteAccountTableViewController: DefaultTableViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deleteAccount() {
        if let password = passwordTextField.text, password.count > 0 {
            showLoading()
            
            Client.deleteAccount(clientAuthFactor: password, clientIdentityProvider: .synerise, authID: nil) { (isSuccess) in
                self.hideLoading()
                self.showSuccessInfo()
            } failure: { (error) in
                self.hideLoading()
                self.showErrorInfo(error as NSError)
            }
        } else {
            Client.retrieveToken { (token) in
                if token.origin == .facebook {
                    guard let facebookToken = AccessToken.current?.tokenString else {
                        return
                    }
                    
                    Client.deleteAccount(clientAuthFactor: facebookToken, clientIdentityProvider: .facebook, authID: nil) { (isSuccess) in
                        self.hideLoading()
                        self.showSuccessInfo()
                    } failure: { (error) in
                        self.hideLoading()
                        self.showErrorInfo(error as NSError)
                    }
                }
                
                if token.origin == .apple {
                    if #available(iOS 13.0, *) {
                        self.appleSignInTapped()
                    }
                }
                
            } failure: { (error) in
                
            }

        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Delete Account"
    }

    // MARK: - Private
    
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
    
    @available(iOS 13.0, *)
    func deleteAccountByAppleSignIn(appleIdCredential: ASAuthorizationAppleIDCredential) {
        Client.deleteAccount(clientAuthFactor: appleIdCredential.identityToken as Any, clientIdentityProvider: .apple, authID: nil) { (isSuccess) in
            self.hideLoading()
            self.showSuccessInfo()
        } failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
}

@available(iOS 13.0, *)
extension DeleteAccountTableViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

@available(iOS 13.0, *)
extension DeleteAccountTableViewController: ASAuthorizationControllerDelegate {
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
            self.deleteAccountByAppleSignIn(appleIdCredential: appleIDCredential)
        }
    }
}
