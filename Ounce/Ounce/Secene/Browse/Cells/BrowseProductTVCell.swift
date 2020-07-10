//
//  BrowseProductTVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit
import Then

class BrowseProductTVCell: UITableViewCell {

    // MARK: - UI components

    let productIMG = UIImageView().then {
        $0.backgroundColor = .pale
        $0.frame = .init(x: 0, y: 0, width: 62, height: 62)
        $0.setRounded(radius: 8)
    }
    
    let productCompanyLabel = UILabel().then {
        $0.text = "유유유유저"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .greyishBrownTwo
    }
    
    let productLabel = UILabel().then {
        $0.text = "고양이"
        $0.textColor = .greyishBrown
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    let productContentLabel = UILabel().then {
        $0.text = "한 줄 글"
        $0.textColor = .putty
        $0.font = Font.errorLabel
    }
    
    let starIMG = UIImageView().then {
        $0.image = UIImage(named: "icTotalSelected")
    }
    let starLabel = UILabel().then {
        $0.text = "0"
        $0.font = Font.buttonLabel
        $0.textColor = .putty
    }
    let hartIMG = UIImageView().then {
        $0.image = UIImage(named: "icFavoriteSelected")
    }
    let hartLabel = UILabel().then {
        $0.text = "0"
        $0.font = Font.buttonLabel
        $0.textColor = .putty
    }
    
    // MARK: - Variables and Properties
    
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Helper

    func cellConstraint(){
        contentView.addSubview(productIMG)
        contentView.addSubview(productCompanyLabel)
        contentView.addSubview(productLabel)
        contentView.addSubview(productContentLabel)
        contentView.addSubview(starIMG)
        contentView.addSubview(starLabel)
        contentView.addSubview(hartIMG)
        contentView.addSubview(hartLabel)

        productIMG.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
        
        productCompanyLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(productIMG.snp.trailing).offset(12)
        }
        
        productLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productCompanyLabel.snp.bottom)
            make.leading.equalTo(productCompanyLabel.snp.leading)
        }
        
        productContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productLabel.snp.bottom).offset(3)
            make.leading.equalTo(productLabel.snp.leading)
        }
        
        starIMG.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalTo(starLabel.snp.leading).offset(-7)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        
        starLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(hartIMG.snp.centerY)
            make.trailing.equalTo(hartIMG.snp.leading).offset(-7)
        }
        
        hartIMG.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalTo(hartLabel.snp.leading).offset(-3)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }

        hartLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(hartIMG.snp.centerY)
            make.trailing.equalToSuperview().offset(-17)
        }

    }
}
