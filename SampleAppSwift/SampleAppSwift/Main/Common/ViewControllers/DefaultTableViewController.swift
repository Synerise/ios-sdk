//
//  DefaultTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class DefaultTableViewController: UITableViewController {
    
    private var loadingView: LoadingView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareBackButton()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Public
    
    public func showLoading(text: String? = nil) {
        DispatchQueue.main.async {
            if let guardedWindow = UIWindow.mainWindow() {
                let loadingViewFrame = guardedWindow.bounds
                
                if let loadingView = self.loadingView, loadingView.isDescendant(of: guardedWindow) {
                    loadingView.text = text
                    
                    return
                }
                
                let loadingView = LoadingView(frame: loadingViewFrame)
                loadingView.overlayColor = UIColor.white
                loadingView.overlayOpacity = 0.5
                loadingView.loaderStyle = UIActivityIndicatorView.Style.gray
                
                loadingView.text = text
                
                guardedWindow.addSubview(loadingView)
                self.loadingView = loadingView
            }
        }
    }
    
    public func hideLoading() {
        DispatchQueue.main.async {
            if let guardedLoadingView = self.loadingView {
                guardedLoadingView.removeFromSuperview()
                self.loadingView = nil
            }
        }
    }
    
    func prepareBackButton(title: String = "") {
        let backItem = UIBarButtonItem()
        backItem.title = title
        
        navigationItem.backBarButtonItem = backItem
    }
    
    func showSuccessInfo(_ title: String = "Success", text: String? = nil, debug: Bool = false) {
        DispatchQueue.main.async {
            UserInfoMessageManager.shared.success(title, text)
        }
        
        if debug {
            DebugUtils.print("\(title) \(text ?? "")")
        }
    }
    
    func showErrorInfo(_ error: NSError, title: String = "Error", debug: Bool = true) {
        DispatchQueue.main.async {
            UserInfoMessageManager.shared.error(title, "\(error.code) \(error.localizedDescription)\n\n\(error.localizedFailureReason ?? "")")
        }
        
        if debug {
            DebugUtils.print("\(title) \(error.code) \(error.localizedDescription)")
        }
    }
}
