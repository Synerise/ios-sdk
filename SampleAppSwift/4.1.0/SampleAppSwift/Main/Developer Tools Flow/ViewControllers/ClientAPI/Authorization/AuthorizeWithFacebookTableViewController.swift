//
//  AuthorizeWithFacebookTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

class AuthorizeWithFacebookTableViewController: DefaultTableViewController {

    @IBOutlet weak var authIDTextField: UITextField!
    @IBOutlet weak var facebookLoginContainerView: UIView!
   
    // MARK: - IBAction
    
    @IBAction func authorizeWithLegacyMethodButtonWasPressed(_ sender: DefaultButton) {
        self.authorize_legacyMethod()
    }
    
    @IBAction func authorizeWithConsolidatedMethodButtonWasPressed(_ sender: DefaultButton) {
        self.authorize_consolidatedMethod()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
    super.viewDidLoad()
        self.navigationItem.title = "Authorize with Facebook"
        prepareFacebookLoginButton()
    }
    
    // MARK: - Private
    
    private func prepareFacebookLoginButton() {
        let loginButton = FBLoginButton()
        self.facebookLoginContainerView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: facebookLoginContainerView.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: facebookLoginContainerView.topAnchor, constant: 20).isActive = true
    }
    
    private func authorize_legacyMethod() {
        guard let facebookToken = AccessToken.current?.tokenString else {
            self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "There is no active Facebook Token. You have to be authorized to app by Facebook."
            ]))
            return
        }
        
        let authID = authIDTextField.text != nil && authIDTextField.text!.isEmpty == false ? authIDTextField.text : nil
        
        let agreements: ClientAgreements = ClientAgreements()
        let context: ClientFacebookAuthenticationContext = ClientFacebookAuthenticationContext()
        context.agreements = agreements
        context.attributes = ["param": "value"]
        
        self.showLoading()
        Client.authenticateByFacebookIfRegistered(facebookToken: facebookToken, authID: authID) { isSuccess in
            self.hideLoading()
            self.showSuccessInfo()
        } failure: { apiError in
            if apiError.code == 404 {
                let errorMessage = "Client.authenticateByFacebookIfRegistered \n\n \(apiError.code) \(apiError.localizedDescription)"
                let alertController = UIAlertController(title: "Client Facebook Auth", message: errorMessage, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.hideLoading()
                }))
                alertController.addAction(UIAlertAction(title: "Client.authenticateByFacebook", style: .default, handler: { _ in
                    Client.authenticateByFacebook(facebookToken: facebookToken, authID: authID, context: context, success: { isSuccess in
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
    
    private func authorize_consolidatedMethod() {
        guard let facebookToken = AccessToken.current?.tokenString else {
            self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "There is no active Facebook Token. You have to be authorized to app by Facebook."
            ]))
            return
        }
        
        let authID = authIDTextField.text != nil && authIDTextField.text!.isEmpty == false ? authIDTextField.text : nil
        
        let agreements: ClientAgreements = ClientAgreements()
        let context: ClientConditionalAuthenticationContext = ClientConditionalAuthenticationContext()
        context.agreements = agreements
        context.attributes = ["param": "value"]
            
        showLoading()
        Client.authenticateConditionally(token: facebookToken, clientIdentityProvider: .facebook, authID: authID, context: context) { authResult in
            if authResult.status == .success {
                self.hideLoading()
                self.showSuccessInfo()
            } else if authResult.status == .registrationRequired {
                self.hideLoading()
                
                let statusString = SNR_ClientConditionalAuthStatusToString(.registrationRequired)
                let errorMessage = "Client.authenticate \n\n Status is \(statusString)"
                let alert = UIAlertController(title: "Client Facebook Auth", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Client.authenticate", style: .default, handler: { _ in
                    let agreements: ClientAgreements = ClientAgreements()
                    let context: ClientAuthenticationContext = ClientAuthenticationContext()
                    context.agreements = agreements
                    context.attributes = ["param": "value"]
                    
                    Client.authenticate(token: facebookToken, clientIdentityProvider: .facebook, authID: authID, context: context, success: { isSuccess in
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
                let alertController = UIAlertController(title: "Client Facebook Auth", message: errorMessage, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.hideLoading()
                }))
                alertController.addAction(UIAlertAction(title: "Client.authenticate", style: .default, handler: { _ in
                    let agreements: ClientAgreements = ClientAgreements()
                    let context: ClientAuthenticationContext = ClientAuthenticationContext()
                    context.agreements = agreements
                    context.attributes = ["param": "value"]
                    
                    Client.authenticate(token: facebookToken, clientIdentityProvider: .facebook, authID: authID, context: context, success: { isSuccess in
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
}
