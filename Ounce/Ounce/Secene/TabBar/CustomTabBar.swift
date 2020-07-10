//
//  CustomTabBar.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

/// Upload button click agent
protocol RootTabBarDelegate:NSObjectProtocol {
    func addClick()
}

class CustomTabBar: UITabBar {
    
    weak var addDelegate: RootTabBarDelegate?
    
    private lazy var addButton:UIButton = {
        return UIButton()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButton.setBackgroundImage(UIImage.init(named: "btnWrite"), for: .normal)
        addButton.setBackgroundImage(UIImage.init(named: "btnWrite"), for: .selected)
        addButton.setBackgroundImage(UIImage.init(named: "btnWrite"), for: .highlighted)
        if model() {
            addButton.transform = CGAffineTransform(translationX: 0, y: 14)
        }
        UITabBar.clearShadow()
        addButton.addTarget(self,
                            action: #selector(CustomTabBar.addButtonClick),
                            for: .touchUpInside)
        self.addSubview(addButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addButtonClick(){
        if addDelegate != nil{
            addDelegate?.addClick()
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let buttonX = self.frame.size.width/3
        var index = 0
        for barButton in self.subviews{
            
            if barButton.isKind(of: NSClassFromString("UITabBarButton")!){
                
                if index == 1{
                    /// Setting the Add Button Position
                    addButton.frame.size = CGSize.init(width: (addButton.currentBackgroundImage?.size.width)!, height: (addButton.currentBackgroundImage?.size.height)!)
                    addButton.center = CGPoint.init(x: self.center.x, y: self.frame.size.height/2 - 18)
                    index += 1
                }
                barButton.frame = CGRect.init(x: buttonX * CGFloat(index), y: 0, width: buttonX, height: self.frame.size.height)
                index += 1
                
            }
        }
        self.bringSubviewToFront(addButton)
    }
    
    /// Rewrite the hitTest method, listen for the button click to make the highlighted tabbar part respond to the click
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        /// Determine whether it is the root controller
        if self.isHidden {
            /// tabbar hiding is not handled in the home page system
            return super.hitTest(point, with: event)
            
        }else{
            /// Converting Money Touch Points to Buttons to Generate New Points
            let onButton = self.convert(point, to: self.addButton)
            /// Determine whether the new point is on the button
            if self.addButton.point(inside: onButton, with: event){
                return addButton
            }else{
                /// No System Processing on the Button
                return super.hitTest(point, with: event)
            }
        }
    }
    
    func model() -> Bool {
        switch UIDevice.current.name {
        case "iPhone SE (2nd generation)":
            return true
        case "iPhone SE":
            return true
        case "iPhone 8":
            return true
        case "iPhone 8 Plus":
            return true
        case "iPhone 7":
            return true
        case "iPhone 7 Plus":
            return true
        case "iPhone 6":
            return true
        case "iPhone 6 Plus":
            return true
        default:
            return false
        }
    }
    
}

extension CGFloat {
    
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
