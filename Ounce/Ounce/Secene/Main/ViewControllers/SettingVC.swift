//
//  SettingVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

// MARK: - tableViewCell 오토 잡아야 함, 코드는 다 입력,,
class SettingVC: UIViewController {
    
    var list = ["",
                "로그아웃",
                "정보수정요청",
                "",
                "이용약관",
                "버전정보",
                "FAQ",
                "문제보고",
                "",
                "계정삭제"]
    
    @IBOutlet weak var settingTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTV.delegate = self
        settingTV.dataSource = self
        settingTV.separatorStyle = .none
        
        navigationController?.isNavigationBarHidden = false
        
    }
    
    
}

extension SettingVC {
    func setNav(){
        
    }
}
extension SettingVC : UITableViewDelegate { }
extension SettingVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = settingTV.dequeueReusableCell(withIdentifier: "FirstSettingTC", for: indexPath)
        if list[indexPath.row] == "" {
            firstCell.backgroundColor = .whiteTwo
        } else {
            firstCell.textLabel?.text = list[indexPath.row]
        }
        return firstCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list[indexPath.row] == "" {
            return 9
        } else {
            return 64
        }
    }
}



