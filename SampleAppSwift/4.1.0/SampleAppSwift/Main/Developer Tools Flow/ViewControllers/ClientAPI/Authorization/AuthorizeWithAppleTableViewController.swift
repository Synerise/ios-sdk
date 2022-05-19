//
//  AuthorizeWithAppleTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import AuthenticationServices
import SyneriseSDK

@available(iOS 13.0, *)
class AuthorizeWithAppleTableViewController: DefaultTableViewController {

    var appleIDCredential: ASAuthorizationAppleIDCredential?
    
    @IBOutlet weak var authIDTextField: UITextField!
    @IBOutlet weak var appleLoginContainerView: UIView!
    
    // MARK: - IBAction
    
    @IBAction func authorizeWithLegacyMethodButtonWasPressed(_ sender: DefaultButton) {
        self.authorize_legacyMethod(appleIDCredential: appleIDCredential)
    }
    
    @IBAction func authorizeWithConsolidatedMethodButtonWasPressed(_ sender: DefaultButton) {
        self.authorize_consolidatedMethod(appleIDCredential: appleIDCredential)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Authorize with Apple Sign In"
        prepareAppleSignInButton()
    }
    
    // MARK: - Private
    
    @available(iOS 13.0, *)
    func authorize_legacyMethod(appleIDCredential: ASAuthorizationAppleIDCredential?) {
        guard let appleIDCredential = appleIDCredential,
              let identityToken = appleIDCredential.identityToken else {
            self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "There is no active Apple Sign In token!"
            ]))
            return
        }
        
        let authID = authIDTextField.text != nil && authIDTextField.text!.isEmpty == false ? authIDTextField.text : nil
        
        let agreements: ClientAgreements = ClientAgreements()
        let context: ClientAppleSignInAuthenticationContext = ClientAppleSignInAuthenticationContext()
        context.agreements = agreements
        context.attributes = ["param": "value"]
        
        self.showLoading()
        Client.authenticateByAppleSignInIfRegistered(identityToken: identityToken, authID: authID) { isSuccess in
            self.hideLoading()
            self.showSuccessInfo()
        } failure: { apiError in
            if apiError.code == 404 {
                let errorMessage = "Client.authenticateByAppleSignInIfRegistered \n\n \(apiError.code) \(apiError.localizedDescription)"
                let alertController = UIAlertController(title: "Client Apple Auth", message: errorMessage, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.hideLoading()
                }))
                alertController.addAction(UIAlertAction(title: "Client.authenticateByAppleSignIn", style: .default, handler: { _ in
                    Client.authenticateByAppleSignIn(identityToken: identityToken, authID: authID, context: context, success: { isSuccess in
                        self.hideLoading()
                        self.showSuccessInfo()
                    }) { (apiError) in
                        self.hideLoading()
                        self.showErrorInfo(apiError)
                    }
                }))
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.hideLoading()
                self.showErrorInfo(apiError)
            }
        }
    }
    
    private func authorize_consolidatedMethod(appleIDCredential: ASAuthorizationAppleIDCredential?) {
        guard let appleIDCredential = appleIDCredential,
              let identityToken = appleIDCredential.identityToken else {
            self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "There is no active Apple Sign In token!"
            ]))
            return
        }
        
        let authID = authIDTextField.text != nil && authIDTextField.text!.isEmpty == false ? authIDTextField.text : nil
        
        let agreements: ClientAgreements = ClientAgreements()
        let context: ClientConditionalAuthenticationContext = ClientConditionalAuthenticationContext()
        context.agreements = agreements
        context.attributes = ["param": "value"]
        
        showLoading()
        Client.authenticateConditionally(token: identityToken, clientIdentityProvider: .apple, authID: authID, context: context) { authResult in
            if authResult.status == .success {
                self.hideLoading()
                self.showSuccessInfo()
            } else if authResult.status == .registrationRequired {
                self.hideLoading()
                
                let statusString = SNR_ClientConditionalAuthStatusToString(.registrationRequired)
                let errorMessage = "Client.authenticate \n\n Status is \(statusString)"
                let alert = UIAlertController(title: "Client Apple Auth", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Client.authenticate", style: .default, handler: { _ in
                    let agreements: ClientAgreements = ClientAgreements()
                    let context: ClientAuthenticationContext = ClientAuthenticationContext()
                    context.agreements = agreements
                    context.attributes = ["param": "value"]
                    
                    Client.authenticate(token: identityToken, clientIdentityProvider: .facebook, authID: authID, context: context, success: { isSuccess in
                        self.hideLoading()
                        self.showSuccessInfo()
                    }) { (apiError) in
                        self.hideLoading()
                        self.showErrorInfo(apiError)
                    }
                    
                }))
            } else {
                self.hideLoading()
                self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                    NSLocalizedDescriptionKey: "Status \(SNR_ClientConditionalAuthStatusToString(authResult.status)) is not supported!"
                ]))
            }
        } failure: { apiError in
            if apiError.code == 404 {
                let errorMessage = "Client.authenticateConditionally \n\n \(apiError.code) \(apiError.localizedDescription)"
                let alertController = UIAlertController(title: "Client Apple Auth", message: errorMessage, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.hideLoading()
                }))
                alertController.addAction(UIAlertAction(title: "Client.authenticate", style: .default, handler: { _ in
                    let agreements: ClientAgreements = ClientAgreements()
                    let context: ClientAuthenticationContext = ClientAuthenticationContext()
                    context.agreements = agreements
                    context.attributes = ["param": "value"]
                    
                    Client.authenticate(token: identityToken, clientIdentityProvider: .apple, authID: authID, context: context, success: { isSuccess in
                        self.hideLoading()
                        self.showSuccessInfo()
                    }) { (apiError) in
                        self.hideLoading()
                        self.showErrorInfo(apiError)
                    }
                }))
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.hideLoading()
                self.showErrorInfo(apiError)
            }
        }
    }

    private func prepareAppleSignInButton() {
        let appleSignInButton = ASAuthorizationAppleIDButton()
        appleSignInButton.addTarget(self, action: #selector(appleSignInTapped), for: .touchUpInside)
        
        self.appleLoginContainerView.addSubview(appleSignInButton)
        
        appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        appleSignInButton.centerXAnchor.constraint(equalTo: appleLoginContainerView.centerXAnchor).isActive = true
        appleSignInButton.topAnchor.constraint(equalTo: self.appleLoginContainerView.topAnchor, constant: 20).isActive = true
    }
    
    @objc func appleSignInTapped() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        
        request.requestedScopes = [.fullName, .email]

        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.presentationContextProvider = self
        authController.delegate = self
        authController.performRequests()
    }
}

@available(iOS 13.0, *)
extension AuthorizeWithAppleTableViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

@available(iOS 13.0, *)
extension AuthorizeWithAppleTableViewController: ASAuthorizationControllerDelegate {
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
            self.appleIDCredential = appleIDCredential
        }
    }
}
