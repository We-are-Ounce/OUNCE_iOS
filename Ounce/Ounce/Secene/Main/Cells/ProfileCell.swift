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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func settingBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        
        
        
//        self.push(dvc, animated: true)
//        
//        dvc.modalPresentationStyle = .overFullScreen
//
//        self.rootVC?.present(dvc, animated: false)
//
        
        
        //
        
        //        self.rootVC.push(dvc, animated: true)
        
        //  dvc.view.alpha = 0.5
        
        
        
        
    }
}
