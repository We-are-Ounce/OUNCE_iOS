//
//  SettingVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

// MARK: - tableViewCell 오토 잡아야 함, 코드는 다 입력,,
class SettingVC: UIViewController, UIAdaptivePresentationControllerDelegate {

    var FirstList = ["로그아웃", "정보수정요청"]
    var SecondList = ["이용약관", "버전정보", "FAQ", "문제보고"]
    var ThirdList = ["계정삭제"]
    
    @IBOutlet weak var settingTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTV.delegate = self
        settingTV.dataSource = self
        navigationController?.isNavigationBarHidden = false
       
    }

    
}

extension SettingVC : UITableViewDelegate {
    
}

extension SettingVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return FirstList.count
        }
        else if section == 1 {
            return SecondList.count
        }
        else{
            return ThirdList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let firstCell = settingTV.dequeueReusableCell(withIdentifier: "FirstSettingTC", for: indexPath)
            
            return firstCell
        }
        else if indexPath.section == 1 {
            let secondCell = settingTV.dequeueReusableCell(withIdentifier: "SecondSettingTC", for: indexPath)
            
            return secondCell
            
        } else{
            let thirdCell = settingTV.dequeueReusableCell(withIdentifier: "ThirdSettingTC", for: indexPath)
            
            return thirdCell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            if indexPath.section == 0 {
               
                return 80
            }
            else if indexPath.section == 1 {
                
                 return 100
            }
            else{
                 return 40
            }
        }
        
        // Set the spacing between sections
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            
            if section == 1 {
                return 20
            }
            else if section == 2{
                return 20
            }
            else {
                return 0
            }
            
        }

        // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.black
            return headerView
        }
    }
    
    
}
