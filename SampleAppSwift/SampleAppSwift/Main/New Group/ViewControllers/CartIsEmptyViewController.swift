//
//  CongratulationsAlertView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CartIsEmptyViewController: DefaultViewController {
    
    var mainView: UIView!
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareLeftMenuButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addMainView()
        addImageView()
        addTitleLabel()
        addSubtitleLabel()
    }
    
    // MARK: - Private
    
    private func addMainView() {
        self.mainView = UIView()
        setupMainView()
        self.view.addSubview(mainView)
        setMainViewConstraints()
    }
    
    private func setupMainView() {
        mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setMainViewConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    private func addImageView() {
        self.imageView = UIImageView()
        setImageViewUI()
        mainView.addSubview(self.imageView)
        setImageViewConstraints()
    }
    
    private func setImageViewUI() {
        imageView.image = UIImage(named: "Cart/empty_cart_image")
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 200.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30.0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30.0).isActive = true
    }
    
    private func addTitleLabel() {
        self.titleLabel = UILabel()
        setTitleLabelUI()
        mainView.addSubview(self.titleLabel)
        setTitleLabelConstraints()
    }
    
    private func setTitleLabelUI() {
        titleLabel.text = "Your cart is empty"
        titleLabel.font = UIFont(name: "AvenirNext-Regular", size: 26.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = #colorLiteral(red: 0.2196078431, green: 0.262745098, blue: 0.3137254902, alpha: 1)
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    }
    
    private func addSubtitleLabel() {
        self.subtitleLabel = UILabel()
        setSubtitleLabelUI()
        mainView.addSubview(self.subtitleLabel)
        setSubtitleLabelConstraints()
    }
    
    private func setSubtitleLabelUI() {
        subtitleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        subtitleLabel.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = #colorLiteral(red: 0.5803921569, green: 0.6196078431, blue: 0.6509803922, alpha: 1)
        subtitleLabel.numberOfLines = 0
    }
    
    private func setSubtitleLabelConstraints() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40.0).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40.0).isActive = true
    }
}
