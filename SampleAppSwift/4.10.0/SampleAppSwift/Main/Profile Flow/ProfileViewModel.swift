//
//  MyProfileViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

protocol ProfileViewModelDelegate: class {
    func userUpdatingSuccess(_ registrationViewModel: ProfileViewModel, response: Any)
    func userUpdatingError(_ registrationViewModel: ProfileViewModel, error: Error)
}

class ProfileViewModel {
    
    var coordinator: ProfileCoordinator?
    weak var delegate: ProfileViewModelDelegate?

    var profileFormViewModel: ProfileFormViewModel = {
        let profileFormViewModel = ProfileFormViewModel()
        return profileFormViewModel
    }()
    
    // MARK: - Init
    
    init() {
        setup()
    }
    
    // MARK: - Public
    
    func clientDataWasUpdated() {
        coordinator?.clientDataWasUpdated()
    }
    
    // MARK: - Private
    
    private func setup() {
        profileFormViewModel.invokeOnSuccess { response in
            self.delegate?.userUpdatingSuccess(self, response: response)
        }
        
        profileFormViewModel.invokeOnError { error in
            self.delegate?.userUpdatingError(self, error: error)
        }
    }
}
