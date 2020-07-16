//
//  FoodCVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class FoodCVC: UICollectionViewCell {
    
    static let identifier: String = "FoodCVC"
    
    @IBOutlet weak var foodLabel: UIButton!
    
    func round(){
        
        foodLabel.setRounded(radius: 8)
        foodLabel.setBorder(borderColor: .pale, borderWidth: 0.5)
    }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            round()
        }
        
    }
