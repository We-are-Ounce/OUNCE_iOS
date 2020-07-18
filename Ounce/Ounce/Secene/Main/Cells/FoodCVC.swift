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
    
    var bRec : Bool = true
    @IBOutlet weak var foodLabel: UIButton!
    
    func round(){
        
        foodLabel.setRounded(radius: 13)
        foodLabel.setBorder(borderColor: .pale, borderWidth: 1.5)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        round()
    }
    
    @IBAction func clickFoodBtn(_ sender: Any) {
        
        bRec = !bRec
        if bRec {
            foodLabel.setBorder(borderColor: .darkPeach, borderWidth: 1.5)
        } else {
            foodLabel.setBorder(borderColor: .pale, borderWidth: 1.5)
        }
        
    }
}
