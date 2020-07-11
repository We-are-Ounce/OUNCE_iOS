//
//  AcquaintanceTVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class AcquaintanceTVC: UITableViewCell {
    
    // MARK: - UI components

    let catSocialNameLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    let catSocialWeightLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
    let catSocialAgeLabel = UILabel().then {
           $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
       }
    
    let catSocialImg = UIImageView().then{
        $0.backgroundColor = .gray
    }
    
    let catSexImg = UIImageView().then {
        $0.backgroundColor = .green
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataInformation(catSocialName: String, catSocialWeight: String, catSocialAge: String){
        
        catSocialNameLabel.text = catSocialName
        catSocialWeightLabel.text = catSocialWeight
        catSocialAgeLabel.text = catSocialAge
    }
    
    
    
    func addContenView() {
        
        contentView.addSubview(catSocialImg)
        contentView.addSubview(catSocialAgeLabel)
        contentView.addSubview(catSocialWeightLabel)
        contentView.addSubview(catSocialNameLabel)
        contentView.addSubview(catSexImg)
  
        catSocialImg.snp.makeConstraints{ ( make ) in
            make.top.equalTo(contentView.snp.top).inset(10)
            make.leading.equalTo(contentView).inset(23)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        catSocialNameLabel.snp.makeConstraints{ (make ) in

            make.top.equalTo(contentView.snp.top).inset(16)
            make.leading.equalTo(catSocialImg.snp.trailing).inset(-14)
            make.height.equalTo(24)
        }
        
        catSocialWeightLabel.snp.makeConstraints{ ( make ) in
            make.height.equalTo(18)
            make.width.equalTo(38)
            make.top.equalTo(catSocialNameLabel.snp.bottom).inset(-4)
            make.leading.equalTo(catSocialImg.snp.trailing).inset(-14)
        }
        catSocialAgeLabel.snp.makeConstraints { ( make ) in
            make.height.equalTo(18)
            make.width.equalTo(25)
            make.top.equalTo(catSocialNameLabel.snp.bottom).inset(-4)
            make.leading.equalTo(catSocialWeightLabel.snp.trailing).inset(-16)
        }
        catSexImg.snp.makeConstraints { ( make ) in
        
            make.height.equalTo(14)
            make.width.equalTo(8)
            make.top.equalTo(catSocialNameLabel.snp.bottom).inset(-6)
            make.leading.equalTo(catSocialAgeLabel.snp.trailing).inset(-16)
        }
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
