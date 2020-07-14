//
//  ProfileCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    static let identfier = "ProfileCell"
    
    var  rootVC: UIViewController?
 
    // 팔로워, 팔로잉도 데이터 받아와야 함^^ 
    @IBOutlet weak var follower: UIButton!
    @IBOutlet weak var following: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    // MARK: - profile : 받아오는 데이터
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderImg: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    var profile: MyProfile?
    
    func setDataInformation(myWeight: String, myAge: String){
           
          
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
        
        profileImg.imageFromUrl(profile?.profileImg ?? "", defaultImgPath: "")
        nameLabel.text = profile?.profileName
        
        var genderimage = gender(gender: profile?.profileGender ?? "", neutral: profile?.profileNeutral ?? "")
        genderImg.image = UIImage(named: genderimage)
    
        weightLabel.text = profile?.profileWeight ?? "" + "kg"
        ageLabel.text = String(profile?.profileAge ?? 0) + "살"
        introduceLabel.text = profile?.profileInfo
        
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
        
        
        //        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        //        let dvc = storyboard.instantiateViewController(identifier: "AccountVC") as! AccountVC
        //
        //        dvc.modalPresentationStyle = .overFullScreen
        //
        //        self.rootVC?.present(dvc, animated: false, completion: nil)

    }
    
    @IBAction func editBtn(_ sender: Any) {
        
    }
    
   
       
}

