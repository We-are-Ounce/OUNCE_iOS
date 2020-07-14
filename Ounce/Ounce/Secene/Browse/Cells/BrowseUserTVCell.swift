//
//  BrowseUserTVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit
import Then

class BrowseUserTVCell: UITableViewCell {
    
    // MARK: - UI components

    let profileIMG = UIImageView().then {
        $0.backgroundColor = .pale
        $0.frame = .init(x: 0, y: 0, width: 62, height: 62)
        $0.setRounded(radius: nil)
    }
    
    let userLabel = UILabel().then {
        $0.text = "유유유유저"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .greyishBrownTwo
    }
    
    let catLabel = UILabel().then {
        $0.text = "고양이"
        $0.textColor = .greyishBrown
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    let catContentLabel = UILabel().then {
        $0.text = "한 줄 글"
        $0.textColor = .putty
        $0.font = Font.errorLabel
    }
    
    // MARK: - Variables and Properties
    
    var user: User?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Helper

    func cellConstraint(){
        contentView.addSubview(profileIMG)
        contentView.addSubview(userLabel)
        contentView.addSubview(catLabel)
        contentView.addSubview(catContentLabel)
        
        profileIMG.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
        
        userLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(profileIMG.snp.trailing).offset(12)
        }
        
        catLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userLabel.snp.bottom)
            make.leading.equalTo(userLabel.snp.leading)
        }
        
        catContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(catLabel.snp.bottom).offset(3)
            make.leading.equalTo(userLabel.snp.leading)
        }
    }
    
    func cellService(){
        profileIMG.setImage(from: user?.profileImg ?? "")
        userLabel.text = user?.profileName
        catLabel.text = user?.profileName
        catContentLabel.text = user?.profileInfo
        catContentLabel.sizeToFit()
    }
    
}
