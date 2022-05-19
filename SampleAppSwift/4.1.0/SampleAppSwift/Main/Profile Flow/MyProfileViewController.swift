//
//  MyProfileViewController.swift
//  SampleAppSwift
//
//  Created by Krzysztof Kurzawa on 06/07/2018.
//

import UIKit

class ProfileViewController: DefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLeftMenuButton()

        showInformationView(text: "Information View test :-)")
    }
}
