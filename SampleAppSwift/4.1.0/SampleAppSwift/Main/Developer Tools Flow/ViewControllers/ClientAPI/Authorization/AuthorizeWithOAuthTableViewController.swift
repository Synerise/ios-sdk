//
//  AuthorizeWithOAuthTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class AuthorizeWithOAuthTableViewController: DefaultTableViewController {

    @IBOutlet weak var authIDTextField: UITextField!
   
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
        self.navigationItem.title = "Authorize with OAuth"
    }
    
    // MARK: - Private
    
    private func authorize_legacyMethod() {
        guard Client.isSignedIn() == true else {
            self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "Client is not signed in. It's required to pass client token as OAuth access token for testing."
            ]))
            return
        }
        
        let authID = authIDTextField.text != nil && authIDTextField.text!.isEmpty == false ? authIDTextField.text : nil
        
        showLoading()
        Client.retrieveToken { token in
            let agreements: ClientAgreements = ClientAgreements()
            
            let context: ClientOAuthAuthenticationContext = ClientOAuthAuthenticationContext()
            context.agreements = agreements
            context.attributes = ["param": "value"]
            
            self.showLoading()
            Client.authenticateByOAuthIfRegistered(accessToken: token.tokenString, authID: authID) { isSuccess in
                self.hideLoading()
                self.showSuccessInfo()
            } failure: { apiError in
                if apiError.code == 404 {
                    let errorMessage = "Client.authenticateByOuthIfRegistered \n\n \(apiError.code) \(apiError.localizedDescription)"
                    let alertController = UIAlertController(title: "Client OAuth Auth", message: errorMessage, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        self.hideLoading()
                    }))
                    alertController.addAction(UIAlertAction(title: "Client.authenticateByOauth", style: .default, handler: { _ in
                        Client.authenticateByOAuth(accessToken: token.tokenString, authID: authID, context: context, success: { isSuccess in
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
        } failure: { apiError in
            self.hideLoading()
            self.showErrorInfo(apiError as NSError)
        }
    }
    
    private func authorize_consolidatedMethod() {
        guard Client.isSignedIn() == true else {
            self.showErrorInfo(NSError(domain: "SampleAppSwiftErrorDomain", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "Client is not signed in. It's required to pass client token as OAuth access token for testing."
            ]))
            return
        }
        
        let authID = authIDTextField.text != nil && authIDTextField.text!.isEmpty == false ? authIDTextField.text : nil
        
        showLoading()
        Client.retrieveToken { token in
            let agreements: ClientAgreements = ClientAgreements()
            
            let context: ClientConditionalAuthenticationContext = ClientConditionalAuthenticationContext()
            context.agreements = agreements
            context.attributes = ["param": "value"]
            
            self.showLoading()
            Client.authenticateConditionally(token: token.tokenString, clientIdentityProvider: .oAuth, authID: authID, context: context) { authResult in
                if authResult.status == .success {
                    self.hideLoading()
                    self.showSuccessInfo()
                } else if authResult.status == .registrationRequired {
                    self.hideLoading()
                    
                    let statusString = SNR_ClientConditionalAuthStatusToString(.registrationRequired)
                    let errorMessage = "Client.authenticate \n\n Status is \(statusString)"
                    let alert = UIAlertController(title: "Client OAuth Auth", message: errorMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Client.authenticate", style: .default, handler: { _ in
                        let agreements: ClientAgreements = ClientAgreements()
                        let context: ClientAuthenticationContext = ClientAuthenticationContext()
                        context.agreements = agreements
                        context.attributes = ["param": "value"]
                        
                        Client.authenticate(token: token.tokenString, clientIdentityProvider: .oAuth, authID: authID, context: context, success: { isSuccess in
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
                    let alertController = UIAlertController(title: "Client OAuth Auth", message: errorMessage, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        self.hideLoading()
                    }))
                    alertController.addAction(UIAlertAction(title: "Client.authenticate", style: .default, handler: { _ in
                        let agreements: ClientAgreements = ClientAgreements()
                        let context: ClientAuthenticationContext = ClientAuthenticationContext()
                        context.agreements = agreements
                        context.attributes = ["param": "value"]
                        
                        Client.authenticate(token: token.tokenString, clientIdentityProvider: .oAuth, authID: authID, context: context, success: { isSuccess in
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
        } failure: { apiError in
            self.hideLoading()
            self.showErrorInfo(apiError as NSError)
        }
    }
}
