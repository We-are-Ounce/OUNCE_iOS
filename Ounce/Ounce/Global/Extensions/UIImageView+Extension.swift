//
//  UIImageView+Extension.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/03.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Kingfisher

extension UIImageView {
    
    func setImage(from url: String){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!,
                         placeholder: UIImage(),
                         options: [.transition(.fade(1))],
                         progressBlock: nil)
        
    }
}
