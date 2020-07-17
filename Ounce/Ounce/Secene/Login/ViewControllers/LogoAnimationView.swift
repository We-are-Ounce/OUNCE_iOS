//
//  LogoAnimationView.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/18.
//  Copyright © 2020 박주연. All rights reserved.
//


import UIKit

import SwiftyGif

class LogoAnimationView: UIView {

    let logoGifImageView: UIImageView = {
        guard let gifImage = try? UIImage(gifName: "Screen.gif") else {
            return UIImageView()
        }
        return UIImageView(gifImage: gifImage, loopCount: 1)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(white: 246.0 / 255.0, alpha: 1)
        addSubview(logoGifImageView)
        logoGifImageView.contentMode = .scaleAspectFill
        logoGifImageView.pinEdgesToSuperView()
    }

}
