////
////  SortingVC.swift
////  Ounce
////
////  Created by 박주연 on 2020/07/10.
////  Copyright © 2020 박주연. All rights reserved.
////
//
import UIKit

class SortingVC: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var popView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        self.backgroundDismiss()
        
    }
    
    func backgroundDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(_:))))
    }
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
}
