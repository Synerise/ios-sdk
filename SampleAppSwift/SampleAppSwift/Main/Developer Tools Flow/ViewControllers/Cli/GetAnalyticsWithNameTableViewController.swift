//
//  GetAnalyticsWithNameTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class GetAnalyticsWithNameTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var analyticsNameTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func getAnalyticsButtonWasPressed(_ sender: DefaultButton) {
        getAnalyticsWithName()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Get Analytics With Name"
    }
    
    // MARK: - Private
    
    private func getAnalyticsWithName() {
        guard let analyticsName = analyticsNameTextField.text else {
            analyticsNameTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        showAnalyticsMetrics(analyticsName: analyticsName)
    }
    
    private func showAnalyticsMetrics(analyticsName: String) {
        showLoading()
        Client.getAnalytics(name: analyticsName, success: { (analyticsData) in
            self.hideLoading()
            if analyticsData.isEmpty {
                DispatchQueue.main.async {
                    self.pushToShowClientAnalytics(description: "Data is empty")
                }
            } else {
                guard let stringRepresentation = self.makeStringRepresintation(analyticsData: analyticsData) else { return }
                DispatchQueue.main.async {
                    self.pushToShowClientAnalytics(description: stringRepresentation)
                }
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func makeStringRepresintation(analyticsData: [Any]) -> String? {
        guard let analyticsMetrics = analyticsData as? [AnalyticsMetrics] else { return nil }
        guard let stringRepresentation = AnalyticsMetricsUtils(analyticsMetrics: analyticsMetrics).getStringRepresentation() else { return nil }
        
        return stringRepresentation
    }
    
    private func pushToShowClientAnalytics(description: String) {
        let debugTextViewController = DebugTextViewController(text: description, copyEnabled: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
}
