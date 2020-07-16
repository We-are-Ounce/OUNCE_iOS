//
//  ProfileCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SwiftKeychainWrapper

class ProfileCell: UITableViewCell {
    
    static let identfier = "ProfileCell"
    
    var  rootVC: UIViewController?
    
    // 팔로워, 팔로잉도 데이터 받아와야 함^^
    @IBOutlet weak var follower: UIButton!
    @IBOutlet weak var following: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    
    // MARK: - profile : 받아오는 데이터
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderImg: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    var profile: ProfileInfoArray?
    
    func setDataInformation(myfollower: String,
                            myfollowing: String,
                            myWeight: String,
                            myAge: String){
        
        
        follower.setTitle("팔로워" + myfollower, for: .normal)
        following.setTitle("팔로잉" + myfollowing, for: .normal)
        
        weightLabel.text = myWeight + "kg"
        ageLabel.text =  myAge + "살"
        
    }
    
    func gender (gender : String, neutral : String) -> String {
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
    
    func cellProfile(){
//        dump(profile)
        profileImg.imageFromUrl(profile?.profileImg ?? "", defaultImgPath: "")
        profileImg.setRounded(radius: nil)
        KeychainWrapper.standard.set(profile?.profileName ?? "", forKey: "name")
        nameLabel.text = profile?.profileName
        var genderimage = gender(gender: profile?.profileGender ?? "", neutral: profile?.profileNeutral ?? "")
        genderImg.image = UIImage(named: genderimage)
        
        ageLabel.text = String(profile?.profileAge ?? 0) + "살"
        weightLabel.text = profile?.profileWeight ?? "" + "kg"
        introduceLabel.text = profile?.profileInfo
        
        setDataInformation(myfollower: String(profile?.follower ?? 0 ), myfollowing: String( profile?.following ?? 0 ), myWeight: String(profile?.profileWeight ?? ""), myAge: String(profile?.profileAge ?? 0))
        
        gender(gender: "", neutral: " ")
        follower.setTitle("팔로워 " + String(profile?.follower ?? 0), for: .normal)
        following.setTitle("팔로잉 " + String(profile?.following ?? 0), for: .normal)
    }
    
    // MARK: - 뷰에 관한 것,,
    
    func round(){
        
        follower.setRounded(radius: 8)
        follower.setBorder(borderColor: .pale, borderWidth: 0.5)
        
        following.setRounded(radius: 8)
        following.setBorder(borderColor: .pale, borderWidth: 0.5)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        round()
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func accountBtn(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "AccountVC") as! AccountVC
        
        dvc.modalPresentationStyle = .overFullScreen
        
        self.rootVC?.present(dvc, animated: false)
        
    }
    
    @IBAction func editBtn(_ sender: Any) {
        
    }
    
    
    
}

