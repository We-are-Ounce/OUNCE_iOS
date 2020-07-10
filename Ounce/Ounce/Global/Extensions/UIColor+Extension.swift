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
    
    @nonobjc class var tintColor: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var wheatColor: UIColor {
      return UIColor(red: 248.0 / 255.0, green: 218.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var pinkishColor: UIColor {
      return UIColor(red: 222.0 / 255.0, green: 103.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPink: UIColor {
      return UIColor(red: 224.0 / 255.0, green: 224.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var brownGreyColor: UIColor {
        return UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var greyish_brown: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var battleshipGrey: UIColor {
        return UIColor(red: 103.0 / 255.0, green: 103.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var dark: UIColor {
      return UIColor(red: 39.0 / 255.0, green: 39.0 / 255.0, blue: 78.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var brownGrey: UIColor {
      return UIColor(white: 151.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var wheat: UIColor {
      return UIColor(red: 248.0 / 255.0, green: 218.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPink: UIColor {
      return UIColor(white: 224.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var battleshipGrey: UIColor {
      return UIColor(red: 103.0 / 255.0, green: 103.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPinkTwo: UIColor {
      return UIColor(white: 216.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPinkThree: UIColor {
      return UIColor(white: 240.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var pinkish: UIColor {
      return UIColor(red: 222.0 / 255.0, green: 103.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var greyishBrown: UIColor {
      return UIColor(white: 60.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var lightPeach: UIColor {
      return UIColor(red: 232.0 / 255.0, green: 222.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var white: UIColor {
      return UIColor(white: 1.0, alpha: 1.0)
    }

    @nonobjc class var black: UIColor {
      return UIColor(red: 51.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var whiteTwo: UIColor {
      return UIColor(white: 250.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPinkFour: UIColor {
      return UIColor(white: 219.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var greyishBrownTwo: UIColor {
      return UIColor(red: 81.0 / 255.0, green: 80.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var putty: UIColor {
      return UIColor(red: 174.0 / 255.0, green: 166.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var darkPeach: UIColor {
      return UIColor(red: 226.0 / 255.0, green: 121.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var blackTwo: UIColor {
      return UIColor(white: 0.0, alpha: 1.0)
    }

    @nonobjc class var pale: UIColor {
      return UIColor(red: 235.0 / 255.0, green: 232.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var pinkishGrey: UIColor {
      return UIColor(red: 198.0 / 255.0, green: 193.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var pinkishTan: UIColor {
      return UIColor(red: 237.0 / 255.0, green: 144.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var lightBlueGrey76: UIColor {
      return UIColor(red: 204.0 / 255.0, green: 206.0 / 255.0, blue: 211.0 / 255.0, alpha: 0.76)
    }

    @nonobjc class var gunmetal: UIColor {
      return UIColor(red: 80.0 / 255.0, green: 85.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var lightGreyBlue: UIColor {
      return UIColor(red: 173.0 / 255.0, green: 179.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var paleGrey: UIColor {
      return UIColor(red: 252.0 / 255.0, green: 252.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var greyishBrownThree: UIColor {
      return UIColor(white: 76.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var whiteThree: UIColor {
      return UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPinkFive: UIColor {
      return UIColor(white: 204.0 / 255.0, alpha: 1.0)
    }

}
