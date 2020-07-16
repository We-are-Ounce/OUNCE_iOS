//
//  OtherProfileTVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then
import SnapKit

class OtherProfileTVCell: UITableViewCell {
    
    let profileIMG = UIImageView().then {
        $0.backgroundColor = .pale
    }
    
    let nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    let sexImage = UIImageView()
    let weightLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .putty
    }
    
    let ageLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .putty
    }
    
    let contentLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .greyishBrownTwo
    }
    
    let followerLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    let followingLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    let followButton = UIButton().then {
        $0.backgroundColor = .darkPeach
        $0.makeRounded(cornerRadius: 6)
        $0.setTitle("팔로우", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "icBack"), for: .normal)
    }
    let logoIMG = UIImageView().then {
        $0.image = UIImage(named: "logoBlack")
    }
    
    var profile: MyProfile?
    var rootVC: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func makeConstraint(){
        self.contentView.addSubview(profileIMG)
        self.contentView.addSubview(followButton)
        self.contentView.addSubview(followingLabel)
        self.contentView.addSubview(followerLabel)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(ageLabel)
        self.contentView.addSubview(weightLabel)
        self.contentView.addSubview(sexImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(backButton)
        self.contentView.addSubview(logoIMG)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

        profileIMG.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(59)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.width.equalTo(93)
            make.height.equalTo(93)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileIMG.snp.top)
            make.leading.equalTo(profileIMG.snp.trailing).offset(35)
        }
        
        sexImage.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(63)
            make.leading.equalTo(nameLabel.snp.trailing).offset(16)
            make.width.equalTo(8)
            make.height.equalTo(14)
        }
        weightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(60)
            make.leading.equalTo(sexImage.snp.trailing).offset(8)
        }
        
        ageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(weightLabel.snp.top)
            make.leading.equalTo(weightLabel.snp.trailing).offset(8)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(83)
            make.leading.equalTo(nameLabel.snp.leading)
        }
        
        followerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(107)
            make.leading.equalTo(nameLabel.snp.leading)
            
        }
        
        followingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(107)
            make.leading.equalTo(followerLabel.snp.trailing).offset(10)
        }
        
        followButton.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(130)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-39)
            make.height.equalTo(26)
        }
        
        logoIMG.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(13)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(19)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(6)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.width.equalTo(18)
            make.height.equalTo(29)
        }
    }
    
    func setProfile(){
        profileIMG.imageFromUrl(profile?.profileInfoArray[0].profileImg, defaultImgPath: "")
        nameLabel.text = profile?.profileInfoArray[0].profileName
        switch profile?.profileInfoArray[0].profileGender {
        case "male":
            if profile?.profileInfoArray[0].profileNeutral == "true" {
                sexImage.image = UIImage(named: "unmale")
            } else {
                sexImage.image = UIImage(named: "male")
            }
        case "female":
            if profile?.profileInfoArray[0].profileNeutral == "true" {
                sexImage.image = UIImage(named: "unfemale")
            } else {
                sexImage.image = UIImage(named: "female")
            }
        case .none:
            break
        case .some(_):
            break
        }
        weightLabel.text = (profile?.profileInfoArray[0].profileWeight ?? "") + " kg"
        ageLabel.text = String(profile?.profileInfoArray[0].profileAge ?? 0) + " 살"
        contentLabel.text = profile?.profileInfoArray[0].profileInfo ?? ""
        followerLabel.text = "팔로워 " + String(profile?.profileInfoArray[0].follower ?? 0)
        followingLabel.text = "팔로워 " + String(profile?.profileInfoArray[0].following ?? 0)
    }
    
    @objc func didTapBackButton(){
        rootVC?.navigationController?.popViewController(animated: true)
    }
    
}
