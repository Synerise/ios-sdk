//
//  ContentAPIViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class ContentAPIViewController: DefaultViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_CONTENT_API_TITLE".localized()
        
        prepareBackButton()
    }
}
