//
//  FilterCVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit


class FilterCVC: UICollectionViewCell {
    
     static let identifier: String = "FilterCVC"
    
    @IBOutlet weak var filterBtn: UIButton!
    
    func round(){
        
        filterBtn.setRounded(radius: 11)
        filterBtn.setBorder(borderColor: .pale, borderWidth: 1.5)
        
       
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           
        round()
        
       }
}
