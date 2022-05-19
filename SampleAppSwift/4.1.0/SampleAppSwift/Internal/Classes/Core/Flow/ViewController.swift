//
//  ViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerType: class {

}

class ViewController: UIViewController, ViewControllerType {
    
    var onViewDidLoad: (() -> Void)?
    var onViewWillAppear: (() -> Void)?
    var onViewDidAppear: (() -> Void)?
    var onViewWillDissapear: (() -> Void)?
    var onViewDidDissapear: (() -> Void)?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewDidLoadBlock = onViewDidLoad {
            viewDidLoadBlock()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let viewWillAppearBlock = onViewWillAppear {
            viewWillAppearBlock()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let viewDidAppearBlock = onViewDidAppear {
            viewDidAppearBlock()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let viewWillDisappearBlock = onViewWillDissapear {
            viewWillDisappearBlock()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if let viewDidDisappearBlock = onViewDidDissapear {
            viewDidDisappearBlock()
        }
    }
}
