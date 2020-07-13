//
//  ProfileCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell, UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate {
    
    static let identfier = "ProfileCell"
    
    var  rootVC: UIViewController?
    
    @IBOutlet weak var settingButton: UIButton!
    
    // MARK: - profile : 받아오는 데이터
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderImg: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func accountBtn(_ sender: Any) {
    }
    
    @IBAction func editBtn(_ sender: Any) {
        
    }
    
    @IBAction func settingBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
    }
    
    @IBAction func followerBtn(_ sender: Any) {
    }
    
    @IBAction func followingBtn(_ sender: Any) {
    }
}
