//
//  RichMediaPushViewController.swift
//  SampleAppSwift
//
//  Created by BPOL1179 on 11/09/2018.
//

import UIKit

class RichMediaPushViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func richMedia1() {
        LocalNotificationSender().sendRichMedia1()
    }
    
    @IBAction func richMedia2() {
        LocalNotificationSender().sendRichMedia2()
    }
    
    @IBAction func richMedia3() {
        LocalNotificationSender().sendRichMedia3()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Rich Media Simple Push"
        
        prepareBackButton()
    }
}
