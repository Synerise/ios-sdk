//
//  DebugTextViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class DebugTextViewController: UIViewController {
    
    var text: String = "" {
        didSet {
            self.textView.text = text
        }
    }
    var copyEnabled: Bool!
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 16.0
        
        return stackView
    }()
    
    lazy private var textView: UITextView = {
        let textView = UITextView()
        textView.text = self.text
        textView.font = UIFont.systemFont(ofSize: 12.0)
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    lazy private var copyButton: UIButton = {
        let button = DefaultButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        button.setTitle("Copy", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        
        return button
    }()
    
    // MARK: - IBAction
    
    @objc func copyButtonWasPressed(_ sender: DefaultButton) {
        UIPasteboard.general.string = textView.text
        UserInfoMessageManager.shared.success("Copied", "")
        sender.animateTapping()
    }
    
    // MARK: - Init
    
    convenience init(text: String, copyEnabled: Bool = false) {
        self.init()
        
        self.text = text
        self.copyEnabled = copyEnabled
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets.zero
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        let stackView = self.containerStackView
        scrollView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -(2 * 16.0)).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16.0).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16.0).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.containerStackView.addArrangedSubview(self.textView)
        
        if self.copyEnabled {
            self.copyButton.addTarget(self, action: #selector(copyButtonWasPressed(_:)), for: UIControl.Event.touchUpInside)
            self.containerStackView.addArrangedSubview(self.copyButton)
        }
    }
}
