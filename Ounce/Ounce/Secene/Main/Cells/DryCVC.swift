//
//  DryCVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class DryCVC: UICollectionViewCell {
    
    static let identifier: String = "DryCVC"
    
    @IBOutlet weak var dryLabel: UIButton!
    
    func round(){
        
        dryLabel.setRounded(radius: 8)
        dryLabel.setBorder(borderColor: .pale, borderWidth: 0.5)
    }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            round()
        }
        
}

