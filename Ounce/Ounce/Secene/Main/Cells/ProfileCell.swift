//
//  ProfileCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

protocol touchDelegate {
    
    func touch()
}

class ProfileCell: UITableViewCell {
    
    static let identfier = "ProfileCell"
    
    let rootVC = HomeVC()
    
    var delegate: touchDelegate?
    
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
    
    var Navi: UINavigationController?
    
    //   NavigationController?.isNavigationBarHidden = true
    
    func setup(){
        
        //
        //        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func round(){
        
        follower.setRounded(radius: 8)
        follower.setBorder(borderColor: .pale, borderWidth: 0.5)
        
        following.setRounded(radius: 8)
        following.setBorder(borderColor: .pale, borderWidth: 0.5)
    }
    
    
//    @IBAction func didTapSettingButton(_ sender: Any) {
//        print(#function)
//        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
//        let dvc = storyboard.instantiateViewController(identifier: "SettingVC") as! SettingVC
//        self.rootVC.navigationController?.navigationBar.isHidden = false
//        self.rootVC.present(dvc, animated: true)
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        round()
        setup()
        
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
        
        
        
        
        //        let sb = UIStoryboard(name: "Main", bundle: nil)
        //
        //        let dvc = sb.instantiateViewController(withIdentifier: "SortingVC") as! SortingVC
        //
        //        dvc.modalPresentationStyle = .overFullScreen
        //
        //        self.rootVC?.present(dvc, animated: false)
        
    }
    
    @IBAction func editBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "AccountVC") as! AccountVC
        
        dvc.modalPresentationStyle = .overFullScreen
        
        self.rootVC.present(dvc, animated: false, completion: nil)
        
    }
    
//    @IBAction func settingBtn(_ sender: Any) {
//        
//        if let delegate = self.delegate{
//            
//            delegate.touch()
//        }
//        
//        
//        
//    }
//    
    @IBAction func followerBtn(_ sender: UIButton) {
        
        //        print(#function)
        //
        //        let sb = UIStoryboard(name: "Main", bundle: nil)
        //        let dvc = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        //
        //
        //        dvc.modalPresentationStyle = .overFullScreen
        //
        //         self.rootVC?.present(dvc, animated: false)
        
        
    }
    
    @IBAction func followingBtn(_ sender: UIButton) {
        
        
    }
}

