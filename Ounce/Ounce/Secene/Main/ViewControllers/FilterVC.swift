//
//  FilterVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/09.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var backImg: UIView!
   
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backImg.backgroundColor = .black
        backImg.isOpaque = false
        
      
        // 이거 처리해도 적용 안됨..
        self.preferredContentSize = CGSize(width: 375, height: 200)
        
        view.frame = CGRect(x: 0, y: 0, width:375, height:  200 )
           

        
    }
    
//    func filter(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//
//
//
//        self.preferredContentSize = CGSize(width: 375, height: 200)
//
//     return filter(forPresented: HomeVC, presenting: FilterVC, source: UIViewController)
//
//
//
//}
}
