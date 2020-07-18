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
    
   var bRec : Bool = true
    
    @IBOutlet weak var manuLabel: UIButton!
    
    func round(){
        
        manuLabel.setRounded(radius: 13)
        manuLabel.setBorder(borderColor: .pale, borderWidth: 1.5)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        round()
    }
    @IBAction func clickMenuBtn(_ sender: Any) {
        bRec = !bRec
        if bRec {
            manuLabel.setBorder(borderColor: .darkPeach, borderWidth: 1.5)
        } else {
            manuLabel.setBorder(borderColor: .pale, borderWidth: 1.5)
        }
    }
    
}

