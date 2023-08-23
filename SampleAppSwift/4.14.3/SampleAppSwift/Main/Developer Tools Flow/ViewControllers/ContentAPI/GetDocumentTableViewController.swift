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
    
    @IBOutlet weak var schemaTextField: UITextField!
    @IBOutlet weak var versionTextField: UITextField!
    
    // MARK: IBAction
    
    @IBAction func getDocumentBySlugButtonTapped(_ sender: DefaultButton) {
        guard let slug = slugTextField.text, !slug.isEmpty else {
            return
        }
        
        Content.generateDocument(slug: slug, success: { document in
            self.pushDebugViewController(text: (document.content as AnyObject).description)
        }) { error in
            self.showErrorInfo(error as NSError)
        }
    }
    
    @IBAction func getDocumentBySlugLegacyMethodButtonTapped(_ sender: DefaultButton) {
        guard let slug = slugTextField.text, !slug.isEmpty else {
            return
        }
        
        Content.getDocument(slug: slug, success: { document in
            self.pushDebugViewController(text: (document as AnyObject).description)
        }) { error in
            self.showErrorInfo(error as NSError)
        }
    }
    
    @IBAction func getDocumentsBySchemaButtonTapped(_ sender: DefaultButton) {
        guard let schema = schemaTextField.text, !schema.isEmpty else {
            return
        }
        
        guard let version = versionTextField.text else {
            return
        }
        
        let apiQuery: DocumentsApiQuery = DocumentsApiQuery(type: .bySchema, typeValue: schema)
        
        if version.isEmpty == false {
            apiQuery.version = version
        }

        Content.getDocuments(apiQuery: apiQuery, success: { documents in
            self.pushDebugViewController(text: (documents as AnyObject).description)
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
