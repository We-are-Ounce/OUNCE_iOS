//
//  ManuCVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ManuCVC: UICollectionViewCell {
    
    static let identifier: String = "ManuCVC"
    
    @IBOutlet weak var manuLabel: UIButton!
    
    func round(){
        
        manuLabel.setRounded(radius: 8)
        manuLabel.setBorder(borderColor: .pale, borderWidth: 0.5)
        
    }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            round()
        }
        
    }

