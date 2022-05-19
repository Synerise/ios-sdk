//
//  CongratulationsAlertView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CongratulationsViewController: DefaultViewController {
    
    var onContinueButton: (() -> Void)?
    var onTrackOrderButton: (() -> Void)?
    
    var mainView: UIView!
    var containerView: DefaultView!
    var imageView: UIImageView!
    var congratulationLabel: UILabel!
    var descriptionLabel: UILabel!
    var trackOrderButton: DefaultButton!
    var continueButton: DefaultButton!
    
    // MARK: - IBAction
    
    @objc func trackOrderButtonWasTapped(_ sender: DefaultButton) {
        onTrackOrderButton?()
    }
    
    @objc func continueButtonWasTapped(_ sender: DefaultButton) {
        onContinueButton?()
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addMainView()
        addContainerView()
        addImageView()
        addCongratulationLabel()
        addDescriptionLabel()
        addContinueButton()
        addTrackOrderButton()
        
    }
    
    // MARK: - Private
    
    private func addMainView() {
        self.mainView = UIView()
        setMainViewUI()
        self.view.addSubview(mainView)
        setMainViewConstraints()
    }
    
    private func setMainViewUI() {
        mainView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4020226884)
    }
    
    private func setMainViewConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    private func addContainerView() {
        self.containerView = DefaultView()
        setContainerViewUI()
        mainView.addSubview(containerView)
        setContainerViewConstraints()
    }
    
    private func setContainerViewUI() {
        containerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        containerView.cornerRadius = 5
    }
    
    private func setContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.heightAnchor.constraint(equalToConstant: 500.0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30.0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30.0).isActive = true
    }
    
    private func addImageView() {
        self.imageView = UIImageView()
        setImageViewUI()
        containerView.addSubview(self.imageView)
        setImageViewConstraints()
    }
    
    private func setImageViewUI() {
        imageView.image = UIImage(named: "CongratulationView/order_image")
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30.0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30.0).isActive = true
    }
    
    private func addCongratulationLabel() {
        self.congratulationLabel = UILabel()
        setCongratulationLabelUI()
        containerView.addSubview(self.congratulationLabel)
        setCongratulationLabelConstraints()
    }
    
    private func setCongratulationLabelUI() {
        congratulationLabel.text = "Congratulations"
        congratulationLabel.font = UIFont(name: "AvenirNext-Regular", size: 26.0)
        congratulationLabel.textAlignment = .center
        congratulationLabel.textColor = #colorLiteral(red: 0.2196078431, green: 0.262745098, blue: 0.3137254902, alpha: 1)
    }
    
    private func setCongratulationLabelConstraints() {
        congratulationLabel.translatesAutoresizingMaskIntoConstraints = false
        congratulationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0).isActive = true
        congratulationLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    
    private func addDescriptionLabel() {
        self.descriptionLabel = UILabel()
        setDescriptionLabelUI()
        containerView.addSubview(self.descriptionLabel)
        setDescriptionLabelConstraints()
    }
    
    private func setDescriptionLabelUI() {
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        descriptionLabel.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = #colorLiteral(red: 0.5803921569, green: 0.6196078431, blue: 0.6509803922, alpha: 1)
        descriptionLabel.numberOfLines = 0
    }
    
    private func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: congratulationLabel.bottomAnchor, constant: 20.0).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40.0).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40.0).isActive = true
    }
    
    private func addTrackOrderButton() {
        self.trackOrderButton = DefaultButton()
        setTrackOrderButtonUI()
        containerView.addSubview(self.trackOrderButton)
        setTrackOrderButtonConstraints()
    }
    
    private func setTrackOrderButtonUI() {
        trackOrderButton.setTitle("Track your order", for: .normal)
        trackOrderButton.backgroundColor = #colorLiteral(red: 0.0431372549, green: 0.4078431373, blue: 1, alpha: 1)
        trackOrderButton.cornerRadius = 5
        trackOrderButton.clipsToBounds = true
        trackOrderButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16.0)
        trackOrderButton.addTarget(self, action: #selector(self.trackOrderButtonWasTapped(_:)), for: .touchUpInside)
    }
    
    private func setTrackOrderButtonConstraints() {
        trackOrderButton.translatesAutoresizingMaskIntoConstraints = false
        trackOrderButton.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10.0).isActive = true
        trackOrderButton.widthAnchor.constraint(equalTo: congratulationLabel.widthAnchor, multiplier: 1.0).isActive = true
        trackOrderButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        trackOrderButton.centerXAnchor.constraint(equalTo: congratulationLabel.centerXAnchor).isActive = true
    }
    
    private func addContinueButton() {
        self.continueButton = DefaultButton()
        setContinueButtonUI()
        containerView.addSubview(self.continueButton)
        setContinueButtonConstraints()
    }
    
    private func setContinueButtonUI() {
        continueButton.setTitle("Continue shopping", for: .normal)
        continueButton.cornerRadius = 5
        continueButton.clipsToBounds = true
        continueButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16.0)
        continueButton.setTitleColor(#colorLiteral(red: 0.5803921569, green: 0.6196078431, blue: 0.6509803922, alpha: 1), for: .normal)
        continueButton.addTarget(self, action: #selector(self.continueButtonWasTapped(_:)), for: .touchUpInside)
    }
    
    private func setContinueButtonConstraints() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20.0).isActive = true
        continueButton.widthAnchor.constraint(equalTo: congratulationLabel.widthAnchor, multiplier: 1.0).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: congratulationLabel.centerXAnchor).isActive = true
    }
}
