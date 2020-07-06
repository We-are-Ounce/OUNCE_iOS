//
//  UIColor+Extension.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/03.
//  Copyright © 2020 박주연. All rights reserved.
//


import UIKit

extension UIColor {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    @nonobjc class var signatureColor: UIColor {
        return UIColor(red: 39.0 / 255.0, green: 39.0 / 255.0, blue: 78.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var labelColor: UIColor {
        return UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var wheatColor: UIColor {
      return UIColor(red: 248.0 / 255.0, green: 218.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var pinkishColor: UIColor {
      return UIColor(red: 222.0 / 255.0, green: 103.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var brownGreyColor: UIColor {
        return UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var greyish_brown: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
    }
}
