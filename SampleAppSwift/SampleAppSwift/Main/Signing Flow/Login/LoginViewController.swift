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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLeftMenuButton()
        prepareFacebookLoginButton()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.authenticateByFacebookToken {
            UserInfoMessageManager.shared.success("You are signed in!", nil)
            self.viewModel.coordinator?.userDidLogin()
        }
    }

    // MARK: - Private

    private func prepareFacebookLoginButton() {
        let loginButton = FBSDKLoginButton()
        self.facebookLoginContainerView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: facebookLoginContainerView.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: facebookLoginContainerView.centerYAnchor).isActive = true
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
