//
//  AcquaintanceTVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Kingfisher

class AcquaintanceTVC: UITableViewCell {
    
    // MARK: - UI components

    let catSocialNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        $0.sizeToFit()
        
    }
    
    let catSocialWeightLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .putty
        $0.sizeToFit()
        
    }
    let catSocialAgeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .putty
        $0.sizeToFit()
       }
    
    let catSocialImg = UIImageView().then{
        $0.backgroundColor = .pale
        $0.setRounded(radius: 30)
    }
    
    let catSexImg = UIImageView().then {
        $0.image = UIImage(named: "unfemale")
    }
    
    // MARK - Variable, Properties
    
    
    var followInfo: Follow?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataInformation(catSocialName: String, catSocialWeight: String, catSocialAge: String){
        
        catSocialNameLabel.text = catSocialName
        catSocialWeightLabel.text = catSocialWeight + "kg"
        catSocialAgeLabel.text = catSocialAge + "살"
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
            make.top.equalTo(catSocialNameLabel.snp.bottom).inset(-4)
            make.leading.equalTo(catSocialImg.snp.trailing).inset(-14)
        }
        catSocialAgeLabel.snp.makeConstraints { ( make ) in

            make.top.equalTo(catSocialNameLabel.snp.bottom).inset(-4)
            make.leading.equalTo(catSocialWeightLabel.snp.trailing).inset(-16)
        }
        catSexImg.snp.makeConstraints { ( make ) in
        
            make.top.equalTo(catSocialNameLabel.snp.bottom).inset(-6)
            make.leading.equalTo(catSocialAgeLabel.snp.trailing).inset(-16)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func judgeSex (gender : String, neutral : String) -> String {
        var str = ""
        if gender == "male" {
            if neutral == "true" {
                str = "male.png"
                return str }
            else {
                str = "unmale.png"
                return str
                
            }
        }
        else {
            if neutral == "true" {
            str = "female.png"
                return str
                
            }
            else {
                str = "unfemale.png"
                return str
                
            }
        }
    }
    
    func setCall(){
        catSocialImg.imageFromUrl(followInfo?.profileImg ?? "", defaultImgPath: followInfo?.profileImg ?? "")
        
        catSocialNameLabel.text = followInfo?.profileName
        catSocialWeightLabel.text = followInfo!.profileWeight + "kg"
        catSocialAgeLabel.text = String(followInfo?.profileAge ?? 0) + "살"
        
        var str = judgeSex(gender: followInfo?.profileGender ?? "", neutral: followInfo?.profileNeutral ?? "")
        
        catSexImg.image = UIImage(named: str)
        
    }
}
