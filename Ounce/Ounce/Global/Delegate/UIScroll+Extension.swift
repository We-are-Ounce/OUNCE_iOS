//
//  UIScroll+Extension.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/10.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

extension UIScrollView {

    func scrollToView(view:UIView) {

        if let origin = view.superview {

            // Get the Y position of your child view

            let childStartPoint = origin.convert(view.frame.origin, to: self)

            

            let bottomOffset = scrollBottomOffset()

            if (childStartPoint.y > bottomOffset.y) {

                setContentOffset(bottomOffset, animated: true)

            } else {

                setContentOffset(CGPoint(x: 0, y: childStartPoint.y), animated: true)

            }

        }

    }

    func scrollToTop() {

        let topOffset = CGPoint(x: 0, y: -contentInset.top)

        setContentOffset(topOffset, animated: true)
    }

    

    // Bonus: Scroll to bottom

    func scrollToBottom() {

        let bottomOffset = scrollBottomOffset()

        if(bottomOffset.y > 0) {

            setContentOffset(bottomOffset, animated: true)

        }

    }

    

    private func scrollBottomOffset() -> CGPoint {

        return CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)

    }

    

}
