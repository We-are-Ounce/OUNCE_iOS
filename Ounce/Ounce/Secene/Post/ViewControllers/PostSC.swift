//
//  PostSC.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostSC:UIView {
    
    @IBOutlet weak var memoTextView: UITextView!
    func viewDidLoad(){
       
        self.memoTextView.layer.borderWidth = 1.0
        self.memoTextView.layer.borderColor = UIColor.black.cgColor
        self.memoTextView.layer.cornerRadius = 8.0
    }
}
