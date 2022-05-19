//
//  MainViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class MainViewController: DefaultViewController {
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let lastViewController = centerNavigationViewController.viewControllers.last as? DefaultViewController else {
            return .default
        }
        
        if lastViewController.darkAppearance == false {
            return .default
        } else {
            return .lightContent
        }
    }
    
    var leftMenuViewController: LeftMenuViewController!
    var centerNavigationViewController: UINavigationController!

    private var leftMenuSingleTapGestureRecognizer: UITapGestureRecognizer!
    private var leftMenuIsOpened: Bool = false

    @IBOutlet weak var leftMenuContainerView: UIView! {
        didSet {
            addLeftMenuViewController()
        }
    }

    @IBOutlet weak var centerContainerView: UIView! {
        didSet {
            addCenterNavigationViewController()
        }
    }

    @IBOutlet weak var centerContainerViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        startObserving()
        setup()
    }
    
    // MARK: - Public

    @objc func showMenu() {
        showLeftMenu(animated: true)
    }

    @objc func hideMenu() {
        hideLeftMenu(animated: true)
    }

    func toggleMenu() {
        // not implemented yet
    }

    // MARK: - Private

    private func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func setup() {
        setLeftMenuHidden()
    }

    @objc private func showLeftMenu(animated: Bool = true) {
        let translationX: CGFloat = 0
        let leftTranslateTransform: CGAffineTransform = CGAffineTransform(translationX: translationX, y: 0)
    
        self.leftMenuContainerView.transform = leftTranslateTransform
        self.leftMenuIsOpened = true
        setNeedsStatusBarAppearanceUpdate()
        
        self.leftMenuViewController.animateIn()
        
        let viewTranslationX: CGFloat = 75
        let viewTranslateTransform: CGAffineTransform = CGAffineTransform(translationX: viewTranslationX, y: 0)
        
        UIView.animate(withDuration: 0.35) {
            self.centerContainerView.transform = viewTranslateTransform
        }
    }

    @objc private func hideLeftMenu(animated: Bool = true) {
        UIView.animate(withDuration: 0.15) {
            self.centerContainerView.transform = .identity
        }
        
        self.leftMenuViewController.animateOut {
            let screenWidth: CGFloat = UIScreen.main.bounds.size.width
            let translationX: CGFloat = -(screenWidth * 1.2)
            let leftTranslateTransform: CGAffineTransform = CGAffineTransform(translationX: translationX, y: 0)
            
            self.leftMenuContainerView.transform = leftTranslateTransform
            self.leftMenuIsOpened = false
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    private func setLeftMenuHidden() {
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        let translationX: CGFloat = -(screenWidth * 1.2)
        let leftTranslateTransform: CGAffineTransform = CGAffineTransform(translationX: translationX, y: 0)
        
        self.leftMenuContainerView.transform = leftTranslateTransform
    }

    private func addLeftMenuViewController() {
        guard let leftMenuViewController = self.leftMenuViewController, let leftMenuView = leftMenuViewController.view
        else {
            fatalError()
        }

        addChild(leftMenuViewController)
        leftMenuContainerView.addSubview(leftMenuView)
        
        leftMenuView.translatesAutoresizingMaskIntoConstraints = false
        leftMenuContainerView.topAnchor.constraint(equalTo: leftMenuView.topAnchor).isActive = true
        leftMenuContainerView.bottomAnchor.constraint(equalTo: leftMenuView.bottomAnchor).isActive = true
        leftMenuContainerView.leftAnchor.constraint(equalTo: leftMenuView.leftAnchor).isActive = true
        leftMenuContainerView.rightAnchor.constraint(equalTo: leftMenuView.rightAnchor).isActive = true
    
        leftMenuViewController.addSingleTapGestureToExit {
            if self.leftMenuIsOpened {
                self.hideLeftMenu()
            } else {
                self.showLeftMenu()
            }
        }
    }

    private func addCenterNavigationViewController() {
        guard let centerNavigationViewController = self.centerNavigationViewController, let centerView = centerNavigationViewController.view
            else {
                fatalError()
        }

        addChild(centerNavigationViewController)
        centerContainerView.addSubview(centerView)
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        centerContainerView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        centerContainerView.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
        centerContainerView.rightAnchor.constraint(equalTo: centerView.rightAnchor).isActive = true
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.centerContainerViewBottomConstraint.constant = keyboardSize.height
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
            self.centerContainerViewBottomConstraint.constant = 0
    }
}
