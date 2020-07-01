//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    
    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func left(_ points: CGFloat) -> Self {
        return position(.left, points: points)
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     label.right(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func right(_ points: CGFloat) -> Self {
        return position(.right, points: -points)
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     label.top(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func top(_ points: CGFloat) -> Self {
        return position(.top, points: points)
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     label.bottom(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func bottom(_ points: CGFloat) -> Self {
        return position(.bottom, points: -points)
    }

    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func left(_ fm: SteviaFlexibleMargin) -> Self {
        return position(.left, relatedBy: fm.relation, points: fm.points)
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     label.right(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func right(_ fm: SteviaFlexibleMargin) -> Self {
        // For right this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.right, relatedBy: n.relation, points: n.points)
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     label.top(20%)
     
    - Returns: Itself for chaining purposes
     */
    @discardableResult
    func top(_ fm: SteviaFlexibleMargin) -> Self {
        return position(.top, relatedBy: fm.relation, points: fm.points)
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     label.bottom(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func bottom(_ fm: SteviaFlexibleMargin) -> Self {
        // For bottom this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.bottom, relatedBy: n.relation, points: n.points)
    }
    
    /** Sets the leading margin for a view.
     
    Example Usage :
     
     label.leading(20)
     label.leading(<=20)
     label.leading(>=20)
     label.leading(20%)
     
    - Returns: itself for chaining purposes
    */
    
    @discardableResult
    func leading(_ points: CGFloat) -> UIView {
        return position(.leading, points: points)
    }
    
    @discardableResult
    func leading(_ fm: SteviaFlexibleMargin) -> UIView {
        return position(.leading, relatedBy: fm.relation, points: fm.points)
    }
    
    /** Sets the trailing margin for a view.
     
    Example Usage :
     
     label.trailing(20)
     label.trailing(<=20)
     label.trailing(>=20)
     label.trailing(20%)
     
    - Returns: itself for chaining purposes
    */
    @discardableResult
    func trailing(_ points: CGFloat) -> UIView {
        return position(.trailing, points: -points)
    }

    @discardableResult
    func trailing(_ fm: SteviaFlexibleMargin) -> UIView {
        var invertedRelation = fm.relation
        if invertedRelation == .lessThanOrEqual {
            invertedRelation = .greaterThanOrEqual
        } else if invertedRelation == .greaterThanOrEqual {
            invertedRelation = .lessThanOrEqual
        }
        return position(.trailing, relatedBy: invertedRelation!, points: -fm.points)
    }
    
    fileprivate func position(_ position: NSLayoutConstraint.Attribute,
                              relatedBy: NSLayoutConstraint.Relation = .equal,
                              points: CGFloat) -> Self {
        if let spv = superview {
            let c = constraint(item: self, attribute: position,
                               relatedBy: relatedBy,
                               toItem: spv,
                               constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}
#endif
