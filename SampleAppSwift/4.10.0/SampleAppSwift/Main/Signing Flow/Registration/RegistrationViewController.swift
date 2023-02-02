//
//  RegistrationViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class RegistrationViewController: DefaultViewController {

    var viewModel: RegistrationViewModel! {
        didSet {
            viewModel.delegate = self

            viewModel.userRegistrationFormViewModel.isProcessing.valueChanged = { isProcessing in
                if isProcessing {
                    self.showLoading()
                } else {
                    self.hideLoading()
                }
            }
        }
    }

    @IBOutlet weak var userRegistrationFormView: UserRegistrationFormView! {
        didSet {
            userRegistrationFormView.setViewModel(viewModel.userRegistrationFormViewModel)
            userRegistrationFormView.delegate = viewModel.userRegistrationFormViewModel
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLeftMenuButton()
        self.hideKeyboardWhenTappedAround()
    }

    // MARK: - Private

    private func handleRegistrationSuccess(_ response: Any) {
        UserInfoMessageManager.shared.success("You have registered!", nil)
        viewModel.userDidRegister()
    }

    private func handleRegistrationError(_ error: Error) {
        showErrorInfo(error as NSError)
    }

}

extension RegistrationViewController: RegistrationViewModelDelegate {
    func userRegistrationProcessing(_ registrationViewModel: RegistrationViewModel, isProcessing: Bool) {
        if isProcessing {
            showLoading()
        } else {
            hideLoading()
        }
    }

    func userRegistrationSuccess(_ registrationViewModel: RegistrationViewModel, response: Any) {
        handleRegistrationSuccess(response)
    }

    func userRegistrationError(_ registrationViewModel: RegistrationViewModel, error: Error) {
        handleRegistrationError(error)
    }
}
