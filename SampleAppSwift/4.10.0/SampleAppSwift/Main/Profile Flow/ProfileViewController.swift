//
//  MyProfileViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class ProfileViewController: DefaultViewController {
    
    var viewModel: ProfileViewModel! {
        didSet {
            viewModel.delegate = self
            
            viewModel.profileFormViewModel.isProcessing.valueChanged = { isProcessing in
                if isProcessing {
                    self.showLoading()
                } else {
                    self.hideLoading()
                }
            }
        }
    }
    
    @IBOutlet weak var profileFormView: ProfileFormView! {
        didSet {
            profileFormView.setViewModel(viewModel.profileFormViewModel)
            profileFormView.delegate = viewModel.profileFormViewModel
        }
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLeftMenuButton()
        self.hideKeyboardWhenTappedAround()
        
        self.viewModel.profileFormViewModel.fetchData()
    }
    
    // MARK: - Private
    
    private func handleUpdatingSuccess(_ response: Any) {
        showSuccessInfo()
        viewModel.clientDataWasUpdated()
    }
    
    private func handleUpdatingError(_ error: NSError) {
        showErrorInfo(error)
    }
    
}

extension ProfileViewController: ProfileViewModelDelegate {
    func userUpdatingSuccess(_ registrationViewModel: ProfileViewModel, response: Any) {
        handleUpdatingSuccess(response)
    }
    
    func userUpdatingError(_ registrationViewModel: ProfileViewModel, error: Error) {
         handleUpdatingError(error as NSError)
    }
    
    func userRegistrationProcessing(_ registrationViewModel: RegistrationViewModel, isProcessing: Bool) {
        if isProcessing {
            showLoading()
        } else {
            hideLoading()
        }
    }
}
