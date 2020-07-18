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
    
    var bRec: Bool = true
    
    @IBOutlet weak var dryLabel: UIButton!
    
    func round(){
        
        dryLabel.setRounded(radius: 13)
        dryLabel.setBorder(borderColor: .pale, borderWidth: 1.5)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        round()
        dryLabel.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @IBAction func clickDryBtn(_ sender: Any) {
        
        bRec = !bRec
        if bRec {
            dryLabel.setBorder(borderColor: .darkPeach, borderWidth: 1.5)
        } else {
            dryLabel.setBorder(borderColor: .pale, borderWidth: 1.5)
        }
        
    }
    
    @objc func didTapButton() -> String{
        return dryLabel.titleLabel?.text ?? ""
    }
}

