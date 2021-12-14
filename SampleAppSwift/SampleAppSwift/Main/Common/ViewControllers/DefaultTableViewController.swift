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
    
    public func hideLoading() {
        if let guardedLoadingView = self.loadingView {
            guardedLoadingView.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    func prepareBackButton(title: String = "") {
        let backItem = UIBarButtonItem()
        backItem.title = title
        
        navigationItem.backBarButtonItem = backItem
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showSuccessInfo(_ title: String = "Success", text: String? = nil, debug: Bool = false) {
        UserInfoMessageManager.shared.success(title, text)
        
        if debug {
            DebugUtils.print("\(title) \(text ?? "")")
        }
    }
    
    func showErrorInfo(_ error: NSError, title: String = "Error", debug: Bool = true) {
        if let apiError = error as? SNRApiError {
            var apiErrorDebugInfo: String = String()
            
            let apiErrorType: SNRApiErrorType = apiError.getType()
            
            switch apiErrorType {
            case .network: apiErrorDebugInfo.append("NETWORK ERROR")
            case .unauthorizedSession: apiErrorDebugInfo.append("UNAUTHORIZED SESSION ERROR")
            case .http: apiErrorDebugInfo.append("HTTP ERROR: \(apiError.getHttpCode())")
            case .unknown: apiErrorDebugInfo.append("UNKNOWN ERROR")
            }
            
            apiErrorDebugInfo.append("\n\n")
            apiErrorDebugInfo.append("\(apiError.localizedDescription)")
            
            //first approach
            if let apiErrorCauses = apiError.errors, !apiErrorCauses.isEmpty {
                apiErrorDebugInfo.append("\n\n")
                
                apiErrorCauses.forEach({ (error) in
                    let apiErrorCause: NSError = error as NSError
                    
                    var apiErrorCauseString: String = String()
                    apiErrorCauseString.append("CODE: \(apiErrorCause.code)")
                    apiErrorCauseString.append("\n")
                    apiErrorCauseString.append("MESSAGE: \(apiErrorCause.localizedDescription)")
                    
                    apiErrorDebugInfo.append(apiErrorCauseString)
                    apiErrorDebugInfo.append("\n\n")
                })
            }
            
            //second approach
            //apiErrorDebugInfo.append("\n\n")
            //
            //let apiErrorCauseString: String = apiError.getBody() ?? ""
            //apiErrorDebugInfo.append(apiErrorCauseString)
            
            UserInfoMessageManager.shared.error(title, "\(apiError.code) \(apiError.localizedDescription)")
            self.presentAlert(title: "Debug SNRApiError", message: apiErrorDebugInfo)
        } else {
            UserInfoMessageManager.shared.error(title, "\(error.code) \(error.localizedDescription)")
            self.presentAlert(title: "Debug NSError", message: error.localizedDescription)
        }
        
        if debug {
            DebugUtils.print("\(title) \(error.code) \(error.localizedDescription)")
        }
    }
    
    func pushDebugViewController(text: String, copyEnabled: Bool = false) {
        let debugTextViewController = DebugTextViewController(text: text, copyEnabled: copyEnabled)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
}
