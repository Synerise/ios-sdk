//
//  LoginViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
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

    // MARK: - IBAction

    @IBAction func createNewAccountButtonWasClicked(_ sender: UIButton) {
        viewModel.createNewAccount()
    }
    
    @IBAction func authByFacebookWasClicked(_ sender: UIButton) {
        viewModel.authenticateByFacebookToken {
            UserInfoMessageManager.shared.success("You are signed in!", nil)
            self.viewModel.coordinator?.userDidLogin()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLeftMenuButton()
        prepareFacebookLoginButton()
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
    
    private func handleRegistrationSuccess(_ response: Any) {
        UserInfoMessageManager.shared.success("You are signed in!", nil)
        self.viewModel.coordinator?.userDidLogin()
    }

    private func handleRegistrationError(_ error: Error) {
        self.showErrorInfo(error as NSError)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func userLoginSuccess(_ loginViewModel: LoginViewModel, response: Any) {
        handleRegistrationSuccess(response)
    }

    func userLoginError(_ loginViewModel: LoginViewModel, error: Error) {
        handleRegistrationError(error)
    }
}
