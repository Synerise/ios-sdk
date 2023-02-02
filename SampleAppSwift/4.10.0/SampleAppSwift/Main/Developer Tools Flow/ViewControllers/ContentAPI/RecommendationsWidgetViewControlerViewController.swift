//
//  RecommendationsWidgetViewControlerViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class RecommendationsWidgetViewControlerViewController: DefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_RECOMMENDATIONS_WIDGET_TITLE".localized()
        
        prepareBackButton()
    }

}
