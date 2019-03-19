//
//  DefaultViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit
import SyneriseSDK

class DefaultViewController: ViewController, Coordinated {
    
    weak var coordinationDelegate: CoordinationDelegate?
    
    var darkAppearance: Bool = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    private var informationView: InformationView?
    private var loadingView: LoadingView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareBackButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    // MARK: - Public
    
    func showLoading(text: String? = nil) {
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
    
    func hideLoading() {
        if let guardedLoadingView = self.loadingView {
            guardedLoadingView.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    func prepareLeftMenuButton() {
        let buttonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_navbar_left_menu"), style: .plain, target: self, action: #selector(self.showLeftMenu))
        buttonItem.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = buttonItem
    }
    
    func prepareRightCartButton() {
        let buttonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_cart"), style: .plain, target: self, action: #selector(self.showCart))
        buttonItem.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    func prepareBackButton(title: String = "") {
        let backItem = UIBarButtonItem()
        backItem.title = title
        
        navigationItem.backBarButtonItem = backItem
    }
    
    @objc func showCart() {
        NotificationCenter.default.post(Notification.init(name: MainCoordinatorNotifications.showCart))
    }
    
    @objc func showLeftMenu() {
        NotificationCenter.default.post(Notification.init(name: MainCoordinatorNotifications.showLeftMenu))
    }
    
    @objc func hideLeftMenu() {
        NotificationCenter.default.post(Notification.init(name: MainCoordinatorNotifications.hideLeftMenu))
    }
    
    func showInformationView(text: String) {
        if let informationView = self.informationView {
            informationView.text = text
            return
        }
        
        let informationView = InformationView(frame: view.frame)
        informationView.overlayColor = UIColor.white
        informationView.overlayOpacity = 0.5
        informationView.text = text
        
        view.addSubview(informationView)
        self.informationView = informationView
    }
    
    func hideInformationView() {
        if let guardedInformationView = self.informationView {
            guardedInformationView.removeFromSuperview()
            self.informationView = nil
        }
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
            
            switch (apiErrorType) {
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
            
            self.presentAlert(title: "Debug SNRApiError", message: apiErrorDebugInfo)
            
            if debug {
                DebugUtils.print("\(title) \(apiError.code) \(apiError.localizedDescription)")
            }
            
            UserInfoMessageManager.shared.error(title, "\(error.code) \(error.localizedDescription)\n\n\(error.localizedFailureReason ?? "")")
            
            return
        }
        
        UserInfoMessageManager.shared.error(title, "\(error.code) \(error.localizedDescription)\n\n\(error.localizedFailureReason ?? "")")
    
        if debug {
            DebugUtils.print("\(title) \(error.code) \(error.localizedDescription)")
        }
    }
}

extension DefaultViewController: RouterModule {
    func toPresent() -> UIViewController {
        return self
    }
}

extension DefaultViewController {
    
    class func addCoordination() {
        DispatchQueue.once(token: "default.viewcontroller.addcoordination") {
            let originalPerformSelector = #selector(DefaultViewController.prepare(for:sender:))
            let swizzledPerformSelector = #selector(swizzledPrepare(for:sender:))
            
            method_exchangeImplementations(class_getInstanceMethod(DefaultViewController.self, originalPerformSelector)!, class_getInstanceMethod(DefaultViewController.self, swizzledPerformSelector)!)
        }
    }
    
    @objc func swizzledPrepare(for segue: UIStoryboardSegue, sender: Any?) {
        defer {
            self.swizzledPrepare(for: segue, sender: self)
        }
        
        guard let sourceViewController = segue.source as? Coordinated else {
            return
        }
        
        sourceViewController.coordinationDelegate?.prepareForSegue(segue: segue)
        
    }
}

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    public class func once(token: String, block:(() -> Void)) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}
