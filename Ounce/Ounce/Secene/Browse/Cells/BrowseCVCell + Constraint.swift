//
//  BrowseCVCell + Constraint.swift
//  Ounce
//
//  Created by psychehose on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit

extension BrowseCVCell{
    
    func initial() {
        
        self.addSubview(customView)
        self.addSubview(imgCatView)
        self.addSubview(imgRecommandFirst)
        self.addSubview(imgRecommandSecond)
        self.addSubview(imgRecommandThird)
        
        customView.layer.borderWidth = 0.5
        customView.layer.borderColor = UIColor.gray.cgColor
        
        contentView.backgroundColor = .brown
        
        
        customView.snp.makeConstraints{( make ) in
            //make.leading.equalToSuperview().offset()
            //make.trailing.equalToSuperview()
           make.top.equalToSuperview().offset(-30)
           // make.width.equalToSuperview().offset(50)
//            make.height.equalToSuperview().offset(50)
            make.height.equalTo(self.contentView.frame.height/2)
            make.width.equalTo(self.contentView.frame.width/2)
        }
        
        //
        
        
//            imgCatView.translatesAutoresizingMaskIntoConstraints = false
//            imgRecommandFirst.translatesAutoresizingMaskIntoConstraints = false
//            imgRecommandSecond.translatesAutoresizingMaskIntoConstraints = false
//            imgRecommandThird.translatesAutoresizingMaskIntoConstraints = false
//
//            self.customView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//            self.customView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//            self.customView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
//            self.customView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
//
//            self.imgCatView.centerXAnchor.constraint(equalTo: self.customView.centerXAnchor).isActive = true
//            self.imgCatView.centerYAnchor.constraint(equalTo: self.customView.centerYAnchor).isActive = true
//            self.imgCatView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
//            self.imgCatView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
//
//            self.imgRecommandFirst.topAnchor.constraint(equalTo: imgCatView.bottomAnchor, constant: 5).isActive = true
//            self.imgRecommandFirst.leadingAnchor.constraint(equalTo: imgCatView.leadingAnchor, constant: 0).isActive = true
//            self.imgRecommandFirst.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05).isActive = true
//            self.imgRecommandFirst.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
//
//            self.imgRecommandSecond.topAnchor.constraint(equalTo: imgCatView.bottomAnchor, constant: 5).isActive = true
//            self.imgRecommandSecond.leadingAnchor.constraint(equalTo: imgCatView.leadingAnchor, constant: 15).isActive = true
//            self.imgRecommandSecond.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05).isActive = true
//            self.imgRecommandSecond.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
//
//            self.imgRecommandThird.topAnchor.constraint(equalTo: imgCatView.bottomAnchor, constant: 5).isActive = true
//            self.imgRecommandThird.leadingAnchor.constraint(equalTo: imgCatView.leadingAnchor, constant: 30).isActive = true
//            self.imgRecommandThird.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05).isActive = true
//            self.imgRecommandThird.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true


        self.imgCatView.image = UIImage(named: "1650")
        self.imgRecommandFirst.image = UIImage(named: "1650")
        self.imgRecommandSecond.image = UIImage(named: "1650")
        self.imgRecommandThird.image = UIImage(named: "1650")

        

        


        
        
    }
}
