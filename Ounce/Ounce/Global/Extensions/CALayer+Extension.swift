//
//  CALayer.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 10,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 1.0
    }

}
