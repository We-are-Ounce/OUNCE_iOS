//
//  ProductDetailTVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ProductDetailTVCell: UITableViewCell {

    // MARK: - UI components

    private let profileIMG = UIImageView().then {
        $0.backgroundColor = .pale
        $0.frame = .init(x: 0, y: 0, width: 62, height: 62)
        $0.setRounded(radius: 31)
    }
    
    private let profileNameLabel = UILabel().then {
        $0.text = "준현"
        $0.font = UIFont.systemFont(ofSize: 15,weight: .medium)
        $0.textColor = .greyishBrownTwo
    }
    
    private let profileAgeLabel = UILabel().then {
        $0.text = "26살"
        $0.textColor = .greyishBrown
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let productContentLabel = UILabel().then {
        $0.text = "배가 매우 고프고 집에 가고 싶어"
        $0.textColor = .putty
        $0.font = Font.errorLabel
    }
    
    private let starIMG = UIImageView().then {
        $0.image = UIImage(named: "icTotalSelected")
    }
    
    private let starLabel = UILabel().then {
        $0.text = "0"
        $0.font = Font.buttonLabel
        $0.textColor = .putty
    }
    
    private let hartIMG = UIImageView().then {
        $0.image = UIImage(named: "icFavoriteSelected")
    }
    
    private let hartLabel = UILabel().then {
        $0.text = "0"
        $0.font = Font.buttonLabel
        $0.textColor = .putty
    }
    
    var review: Review?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Helper

    func cellConstraint(){
        contentView.addSubview(profileIMG)
        contentView.addSubview(profileNameLabel)
        contentView.addSubview(profileAgeLabel)
        contentView.addSubview(productContentLabel)
        contentView.addSubview(starIMG)
        contentView.addSubview(starLabel)
        contentView.addSubview(hartIMG)
        contentView.addSubview(hartLabel)

        profileIMG.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
        
        profileNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(profileIMG.snp.trailing).offset(16)
        }
        
        profileAgeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileNameLabel.snp.top).offset(2)
            make.leading.equalTo(profileNameLabel.snp.trailing).offset(7)
        }
        
        productContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(9)
            make.leading.equalTo(profileIMG.snp.trailing).offset(16)
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
    
    func cellService(){
        profileIMG.imageFromUrl(review?.profileImg, defaultImgPath: "")
        profileNameLabel.text = review?.profileName
        profileAgeLabel.text = String(review?.profileAge ?? 0) + "살"
        productContentLabel.text = review?.reviewInfo
        starLabel.text = review?.reviewRating
        hartLabel.text = review?.reviewPrefer
    }
    
}

