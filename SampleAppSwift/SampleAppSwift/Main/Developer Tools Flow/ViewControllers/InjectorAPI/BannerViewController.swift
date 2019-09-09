//
//  BannerViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class BannerViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func bannerColorAsBackground() {
        LocalNotificationSender().sendBannerColorAsBackground()
    }
    
    @IBAction func bannerImageAsBackground() {
        LocalNotificationSender().sendBannerImageAsBackground()
    }
    
    @IBAction func bannerImageWithTextAtop() {
        LocalNotificationSender().sendBannerImageWithTextAtop()
    }
    
    @IBAction func bannerImageWithTextBelow() {
        LocalNotificationSender().sendBannerImageWithTextBelow()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
