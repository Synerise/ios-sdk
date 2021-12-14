//
//  GetScreenViewTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit

class GetScreenViewTableViewController: DefaultTableViewController {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "VIEW_CONTROLLER_GET_SCREEN_VIEW_TITLE".localized()
        
        prepareBackButton()
    }
}
