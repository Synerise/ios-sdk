//
//  ProfileInfoView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class ProfileInfoView: DefaultView {
    
    private var viewModel: ProfileInfoViewModel?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var avatarImageView: DefaultImageView!
    @IBOutlet weak var nameLabel: BindingLabel!
    @IBOutlet weak var emailLabel: BindingLabel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        baseInit()
    }
    
    // MARK: - Public
    
    func setViewModel(_ viewModel: ProfileInfoViewModel) {
        self.viewModel = viewModel
        
        viewModel.isProcessing.valueChanged = { isProcessing in
            guard let isDownloaded = self.viewModel?.isDownloaded.value, isDownloaded == false else {
                return
            }
            
            self.isLoading(isProcessing)
        }
        
        viewModel.isDownloaded.valueChanged = { isDownloaded in
            if isDownloaded {
                self.containerView.isHidden = false
            }
        }
        
        viewModel.avatarURL.valueChanged = { avatarURL in
            self.avatarImageView.loadImage(withURL: avatarURL, completion: { (success) in
                
            })
        }
        
        nameLabel.bind(to: viewModel.name)
        emailLabel.bind(to: viewModel.email)
    }
    
    // MARK: - Private
    
    private func baseInit() {
        loadFromXib()
        setupAppearance()
    }

    private func setupAppearance() {
        self.containerView.backgroundColor = UIColor.clear
        self.containerView.isHidden = true
        
        if let avatarContainerView = self.avatarImageView.superview {
            avatarContainerView.layer.masksToBounds = true
            avatarContainerView.layer.cornerRadius = CGFloat(avatarContainerView.frame.size.height / 2)
        }
        
        self.avatarImageView.image = nil
        self.nameLabel.text = ""
        self.emailLabel.text = ""
    }
    
    private func isLoading(_ isLoading: Bool) {
        if isLoading {
            self.loadingIndicator.isHidden = false
            self.loadingIndicator.startAnimating()
        } else {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
        }
    }
}
