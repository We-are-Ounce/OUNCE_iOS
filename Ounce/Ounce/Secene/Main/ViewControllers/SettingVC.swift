//
//  SettingVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UIAdaptivePresentationControllerDelegate {

    
    @IBOutlet weak var settingTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
       
    }
    
}
