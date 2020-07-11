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
        
        print(#function)

        let MainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let dvc = MainStoryBoard.instantiateViewController(identifier: "SettingVC") as! SettingVC

        dvc.transitioningDelegate = self
        
//
        
//        self.rootVC.push(dvc, animated: true)
        
        //  dvc.view.alpha = 0.5
              
               
    
        
    }
}
