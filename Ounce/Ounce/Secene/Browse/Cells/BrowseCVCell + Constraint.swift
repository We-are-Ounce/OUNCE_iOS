//
//  BrowseCVCell + Constraint.swift
//  Ounce
//
//  Created by psychehose on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//
//width 375, height 812
import UIKit

import SnapKit

extension BrowseCVCell{


    func initial() {

        contentView.addSubview(customView)
        contentView.addSubview(imgCatView)
        contentView.addSubview(labelName)
        contentView.addSubview(labelCoincidence)
        contentView.addSubview(stackViewLabel)
    
        
 
        customView.layer.shadowColor = UIColor.battleshipGrey.cgColor
        customView.layer.shadowOpacity = 0.2
        customView.layer.shadowOffset = .zero
        customView.layer.shadowRadius = 4
        
        
        customView.snp.makeConstraints{ ( make ) in
            
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
                
        }
        
        
        
        
        imgCatView.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).inset(64)
            make.trailing.equalTo(contentView.snp.trailing).inset(64)
            make.top.equalTo(contentView.snp.top).inset(24)
            make.height.equalTo(91)
        }
        
        // -MARK : 오토레이아웃을 컨텐츠뷰 좌우로 잡았는데 이름이 길었을 경우 어떻게 잡아야하는 지에 대한 의문점.
        
        labelName.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).inset(88)
            make.trailing.equalTo(contentView.snp.trailing).inset(87)
            make.top.equalTo(imgCatView.snp.bottom).inset(-10)
        }
        
        labelCoincidence.snp.makeConstraints{ (make) in
            make.leading.equalTo(contentView.snp.leading).inset(83)
            make.trailing.equalTo(contentView.snp.trailing).inset(83)
            make.top.equalTo(labelName.snp.bottom).inset(-5)
        }
        
        stackViewLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).inset(15)
            make.trailing.equalTo(contentView.snp.trailing).inset(15)
            make.bottom.equalTo(contentView.snp.bottom).inset(25)
            make.top.equalTo(labelCoincidence.snp.bottom).inset(-20)
            
        }
        

        
        



        self.imgCatView.image = UIImage(named: "1650")
//        self.imgRecommandFirst.image = UIImage(named: "1650")
//        self.imgRecommandSecond.image = UIImage(named: "1650")
//        self.imgRecommandThird.image = UIImage(named: "1650")

        
        
    }
}
