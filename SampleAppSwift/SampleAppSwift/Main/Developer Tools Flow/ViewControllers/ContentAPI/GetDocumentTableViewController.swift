//
//  GetDocumentTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class GetDocumentTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var slugTextField: UITextField!
    
    // MARK: IBAction
    
    @IBAction func getDocumentButtonTapped(_ sender: DefaultButton) {
        guard let slug = slugTextField.text else {
            return
        }
        
        Content.getDocument(slug: slug, success: { document in
            self.pushDebugViewController(text: (document as AnyObject).description)
        }) { error in
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "VIEW_CONTROLLER_GET_DOCUMENT_TITLE".localized()
        
        prepareBackButton()
    }
}
