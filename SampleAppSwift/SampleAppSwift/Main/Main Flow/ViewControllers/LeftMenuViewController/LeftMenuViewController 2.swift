//
//  LeftMenuViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

struct LeftMenuConfigure {
    static let itemHeight = 50.0 as CGFloat
    static let itemTextSize = 17.0 as CGFloat
    static let underlayColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
}

class LeftMenuViewController: DefaultViewController {

    var viewModel: LeftMenuViewModel!
    
    private let menuItemCellReuseIdentifier = "menuItemCellReuseIdentifier"
    
    private var emptyAreaTapGestureRecognizer: UITapGestureRecognizer?
    private var emptyAreaTapAction: (() -> Void)?
    
    @IBOutlet weak var loginButton: DefaultButton!
    @IBOutlet weak var profileInfoView: ProfileInfoView! {
        didSet {
            profileInfoView.setViewModel(self.viewModel.profileInfoViewModel)
        }
    }
    
    @IBOutlet weak var menuTableView: UITableView! {
        didSet {
            menuTableView.dataSource = self
            menuTableView.delegate = self
        }
    }
    
    @IBOutlet weak var applicationBuildVersionLabel: UILabel!
    @IBOutlet weak var syneriseSDKConfigurationInfoLabel: UILabel!
    
    @IBOutlet weak var activeAreaContainerView: UIView!
    @IBOutlet weak var activeAreaContainerViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var emptyAreaContainerView: UIView!
    
    // MARK: - IBAction
    
    @IBAction func loginButtonTapped() {
        viewModel.loginSelected()
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupMenuTableView()
        setHidden()
        setApplicationBuildVersionLabel()
        setSyneriseSDKConfigurationInfoLabel()
        
        viewModel.onUpdate = {
            self.refresh()
            self.setApplicationBuildVersionLabel()
            self.setSyneriseSDKConfigurationInfoLabel()
        }
    }

    // MARK: - Public
    
    func addSingleTapGestureToExit(withAction action: @escaping (() -> Void)) {
        if self.emptyAreaTapGestureRecognizer == nil {
            let tapGestureRecognizer = UITapGestureRecognizer()
            tapGestureRecognizer.numberOfTapsRequired = 1
            tapGestureRecognizer.isEnabled = true
            tapGestureRecognizer.addTarget(self, action: #selector(emptyAreaTapGestureRecognized(_:)))
            
            self.emptyAreaContainerView.addGestureRecognizer(tapGestureRecognizer)
        }
        
        self.emptyAreaTapAction = action
    }
    
    func animateIn(completion: (() -> Void)? = nil) {
        self.activeAreaContainerViewLeftConstraint.constant = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.backgroundColor = LeftMenuConfigure.underlayColor
            self.view.layoutIfNeeded()
        }, completion: { _ in
            completion?()
        })
    }
    
    func animateOut(completion: (() -> Void)? = nil) {
        self.activeAreaContainerViewLeftConstraint.constant = -(self.view.frame.size.width)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.backgroundColor = UIColor.clear
            self.view.layoutIfNeeded()
        }, completion: { _ in
            completion?()
        })
    }
    
    // MARK: - Private

    private func setupAppearance() {
        activeAreaContainerView.layer.shadowColor = UIColor.white.cgColor
        activeAreaContainerView.layer.shadowOpacity = 0.55
        activeAreaContainerView.layer.shadowOffset = CGSize.zero
        activeAreaContainerView.layer.shadowRadius = 15
    }
    
    private func setupMenuTableView() {
        menuTableView.tableFooterView = UIView()
        
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: menuItemCellReuseIdentifier)
    }
    
    private func refresh() {
        self.menuTableView.reloadData()
        
        if viewModel.state == .userLogged {
            self.loginButton.isHidden = true
            self.profileInfoView.isHidden = false
            
            self.viewModel.profileInfoViewModel.downloadDataIfNeeded()
        } else {
            self.loginButton.isHidden = false
            self.profileInfoView.isHidden = true
        }
    }
    
    private func setHidden() {
        self.activeAreaContainerViewLeftConstraint.constant = -(self.view.frame.size.width)
    }
    
    private func setApplicationBuildVersionLabel() {
        self.applicationBuildVersionLabel.text = self.viewModel.applicationBuildVersionString
    }
    
    private func setSyneriseSDKConfigurationInfoLabel() {
        self.syneriseSDKConfigurationInfoLabel.text = self.viewModel.syneriseSDKConfigurationInfoString
    }
    
    @objc private func emptyAreaTapGestureRecognized(_ tapGestureRecognizer: UITapGestureRecognizer) {
        emptyAreaTapAction?()
    }
}

extension LeftMenuViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LeftMenuConfigure.itemHeight
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuItemCellReuseIdentifier, for: indexPath)

        let index: Int = indexPath.row
        let cellViewModel: LeftMenuItemViewModel = viewModel.itemForIndex(index)

        cell.backgroundColor = UIColor.clear
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.image = cellViewModel.iconImageView.image
        cell.imageView?.image = cell.imageView?.image?.withRenderingMode(.alwaysTemplate)
        cell.textLabel?.text = cellViewModel.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: LeftMenuConfigure.itemTextSize)

        return cell
    }
}

extension LeftMenuViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int = indexPath.row

        viewModel.itemSelected(index)
        menuTableView.deselectRow(at: indexPath, animated: true)
    }
}
