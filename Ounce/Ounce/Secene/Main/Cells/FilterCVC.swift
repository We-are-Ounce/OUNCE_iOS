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
    
//    var DryList: [Dry] = []
    
    var dryList = ["건식", "습식"]
    
    var menuList = ["연어", "칠면조", "소", "닭", "양", "토끼", "오리", "참치", "돼지", "해산물", "사슴", "캥거루", "기타"]
    
    var manufactureList = ["Go!", "캣츠파인푸드", "테라펠리스", "로얄캐닌", "내추럴발란스", "질랜디아", "나우", "생식본능", "카루", "웰츠", "퍼시캣", "헤일로", "뉴트로", "지위픽", "웰니스", "어딕션", "내추럴플래닛", "블랙우드", "로우즈", "보레알", "아보덤", "K9"]
    
    
    @IBOutlet weak var filterBtn: UIButton!
    
    func round(){
        
        filterBtn.setRounded(radius: 16)
        filterBtn.setBorder(borderColor: .pale, borderWidth: 1.5)
        
       
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           
        round()
        
       }
}
