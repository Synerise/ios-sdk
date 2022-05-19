//
//  DefaultImageView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DefaultImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    // MARK: - public
    
    func loadImage(withURL url: URL, completion: @escaping (Bool) -> Void) {
        self.loadImage(url: url) { (image) in
            DispatchQueue.main.async {
                self.image = image
                completion(true)
            }
        }
    }
    
    // MARK: - Private
    
    func loadImage(url: URL, completion:@escaping (UIImage) -> Void ) {
        Alamofire.request(url).responseImage { response in
            switch response.result {
            case .success(let value):
                let image: UIImage = value
                completion(image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
