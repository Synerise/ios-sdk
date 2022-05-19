//
//  DeleteAccountByAppleTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

import UIKit
import AuthenticationServices
import SyneriseSDK

class DeleteAccountByAppleTableViewController: DefaultTableViewController {

    var identityToken: Data?
    
    @IBAction func deleteAccount() {
        guard let identityToken = identityToken else {
            return
        }
        
        showLoading()
        Client.deleteAccountByAppleSignIn(identityToken: identityToken, success: { (isSuccess) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Delete Account"
        
        if #available(iOS 13.0, *) {
            performExistingAccountSetupFlows()
        }
    }
    
    @available(iOS 13.0, *)
    func performExistingAccountSetupFlows() {
        // Prepare requests for both Apple ID and password providers.
        let requests = [ASAuthorizationAppleIDProvider().createRequest(),
                        ASAuthorizationPasswordProvider().createRequest()]
        
        // Create an authorization controller with the given requests.
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

@available(iOS 13.0, *)
extension DeleteAccountByAppleTableViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            if let identityToken = appleIDCredential.identityToken {
                self.identityToken = identityToken
            }
        }
    }
}

@available(iOS 13.0, *)
extension DeleteAccountByAppleTableViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
