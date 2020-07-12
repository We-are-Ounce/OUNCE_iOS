//
//  FilterVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/09.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet var backView: UIView!
    @IBOutlet weak var backImg: UIView!
   
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.9)

      
        
    }
    
    func backgroundDisMiss(){
      
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self,
        action:Selector(("backgroundTap:"))))
    }
    
    
    @IBAction func backgroundTap( _sender
        : UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
    }

}
