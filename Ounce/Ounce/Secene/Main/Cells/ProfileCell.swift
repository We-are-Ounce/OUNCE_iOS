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
    
    var rootVC: UIViewController?
    
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
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
        
        dvc.modalPresentationStyle = .overFullScreen
        
        self.rootVC?.present(dvc, animated: false)
        
    }
    
    @IBAction func editBtn(_ sender: Any) {
        
    }
    
    @IBAction func settingBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
    }
    
    @IBAction func followerBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Social", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "SocialNVC")
        dvc.modalPresentationStyle = .overFullScreen
        self.rootVC?.present(dvc, animated: false)
    
    }
    
    @IBAction func followingBtn(_ sender: Any) {
        

        let sb = UIStoryboard(name: "Social", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "SocialNVC")
        dvc.modalPresentationStyle = .overFullScreen
        self.rootVC?.present(dvc, animated: false)
        
    }
}
