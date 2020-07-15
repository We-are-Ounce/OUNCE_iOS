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
        contentView.addSubview(firstRecommandImg)
        contentView.addSubview(secondRecommandImg)
        contentView.addSubview(thirdRecommandImg)
        
 
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
            
            make.width.equalTo(contentView.snp.width)
            make.top.equalTo(imgCatView.snp.bottom).inset(-10)
        }
        
        labelCoincidence.snp.makeConstraints{ (make) in
            make.leading.equalTo(contentView.snp.leading).inset(83)
            make.top.equalTo(labelName.snp.bottom).inset(-5)
            
        }
        
        firstRecommandImg.snp.makeConstraints{ ( make ) in
            make.height.equalTo(62)
            make.width.equalTo(57)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(15)
        }
        secondRecommandImg.snp.makeConstraints { ( make ) in
            make.height.equalTo(62)
            make.width.equalTo(57)
            make.bottom.equalTo(contentView.snp.bottom).inset(15)
            make.leading.equalTo(firstRecommandImg.snp.trailing).inset(-9)
        }
        thirdRecommandImg.snp.makeConstraints { ( make ) in
            make.height.equalTo(62)
            make.width.equalTo(57)
            make.bottom.equalTo(contentView.snp.bottom).inset(15)
            make.leading.equalTo(secondRecommandImg.snp.trailing).inset(-9)
        }
        
    }
    
//
//
//    func findFood(target: Int) -> Array<String>{
//
//        var num : Int
//        num = 0
////        var arrNum: Int
////        arrNum = 0
//        var foodStr: [String] = [] //(repeatElement("", count: 3))
//
//
//        while recommendInfo?.recommendFoodList[num] != nil {
////            if target == recommendInfo?.recommendFoodList[num].profileIdx {
////                foodStr.append((recommendInfo?.recommendFoodList[num].foodImg)!)
////                arrNum += 1
////            }
////            num += 1
//            if target == recommendInfo?.recommendFoodList[num].profileIdx {
//                foodStr.append(recommendInfo?.recommendFoodList[num].foodImg ?? "")
//                num += 1
//            }
//        }
//
//        for _ in 0..<3 {
//            foodStr.append("")
//        }
//        print("foodStr", foodStr)
//        return foodStr
//    }
    
    func setCall(num : Int){
        
        
        print(num)
        print(recommendInfo?.resultProfile[num].profileIdx ?? 6000)
        
        imgCatView.imageFromUrl(recommendInfo?.resultProfile[num].profileImg, defaultImgPath: recommendInfo?.resultProfile[num].profileImg)
        labelName.text = recommendInfo?.resultProfile[num].profileName
        labelName.textAlignment = .center
        labelCoincidence.text = String(recommendInfo?.similarity[num] ?? 0) + "% 일치"
        print(item)
        
//        findFood(target: (recommendInfo?.resultProfile[num].profileIdx)!)
//        print("123: ",(recommendInfo?.resultProfile[num].profileIdx ?? 0) )
//        let food: [String] = findFood(target: recommendInfo?.resultProfile[num].profileIdx ?? 0)
////
        firstRecommandImg.imageFromUrl(item[0], defaultImgPath: "")
        secondRecommandImg.imageFromUrl(item[1], defaultImgPath: "")
        thirdRecommandImg.imageFromUrl(item[2], defaultImgPath: "")
//
//
//
        

    
    }
    
}

