//
//  Stevia+Fill.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    
    /**
     Adds the constraints needed for the view to fill its `superview`.
     A padding can be used to apply equal spaces between the view and its superview
    */
    @discardableResult
    func fillContainer(_ padding: CGFloat = 0) -> Self {
        fillHorizontally(m: padding)
        fillVertically(m: padding)
        return self
    }
    
    @available(*, deprecated, message: "Use 'fillVertically' instead")
    /**
     Adds the constraints needed for the view to fill its `superview` Vertically.
     A padding can be used to apply equal spaces between the view and its superview
     */
    func fillV(m points: CGFloat = 0) -> Self {
        return fill(.vertical, points: points)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Vertically.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    func fillVertically(m points: CGFloat = 0) -> Self {
        return fill(.vertical, points: points)
    }
    
    @available(*, deprecated, message: "Use 'fillHorizontally' instead")
    /**
     Adds the constraints needed for the view to fill its `superview` Horizontally.
     A padding can be used to apply equal spaces between the view and its superview
     */
    func fillH(m points: CGFloat = 0) -> Self {
        return fill(.horizontal, points: points)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Horizontally.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    func fillHorizontally(m points: CGFloat = 0) -> Self {
        return fill(.horizontal, points: points)
    }
    
    fileprivate func fill(_ axis: NSLayoutConstraint.Axis, points: CGFloat = 0) -> Self {
        let a: NSLayoutConstraint.Attribute = axis == .vertical ? .top : .leading
        let b: NSLayoutConstraint.Attribute = axis == .vertical ? .bottom : .trailing
        if let spv = superview {
            let c1 = constraint(item: self, attribute: a, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: b, toItem: spv, constant: -points)
            spv.addConstraints([c1, c2])
        }
        return self
    }
}
#endif
