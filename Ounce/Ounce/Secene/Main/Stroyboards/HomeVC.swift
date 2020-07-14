//
//  HomeVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Foundation

class HomeVC: UIViewController {
    
    @IBOutlet weak var reviewTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTV.delegate = self
        reviewTV.dataSource = self
        
        
        // ReviewTableViewCell xib 연결
        let nibName = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        
        // HeaderCell xib 연결
        let nibName1 = UINib(nibName: "HeaderCell", bundle: nil)
        
        reviewTV.register(nibName, forCellReuseIdentifier: "ReviewTableViewCell")
        
        reviewTV.register(nibName1, forCellReuseIdentifier: "HeaderCell")
        
        
        //테이블 셀 라인 없애기
        self.reviewTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.setupLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupLayout() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension HomeVC : UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - TableView Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else {
            return 9
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            //            cell.delegate = self
            cell.settingButton.tag = indexPath.row
            cell.settingButton.addTarget(self, action: #selector(didTapSettingButton), for: .touchUpInside)
            
//            cell.didTapSettingButton(self)
            
            return cell
        }
        else{
            let reviewCell = reviewTV.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
            reviewCell.rootVC = self
            
            
            return reviewCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 1 {
            let sb = UIStoryboard(name: "ProductDetail", bundle: nil)
            let dvc = sb.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
            dvc.modalPresentationStyle = .overFullScreen
            navigationController?.isNavigationBarHidden = false
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                               style: .plain,
                                                               target: nil,
                                                               action: nil)
            self.navigationController?.pushViewController(dvc, animated: true)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 179
        }
        else{
            return 86
        }
    }
    
    
    
    // MARK: - header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1{
            return 47
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            
            let headerCell = reviewTV.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            
            // xib 파일 - headerCell
            headerCell.rootVC = self
            
            return headerCell
        }
        else{
            let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
            let myView = UIView(frame: rect)
            
            return myView
        }
        
    }
    
    
}

extension HomeVC {
    @objc func didTapSettingButton(){
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "SettingVC") as! SettingVC
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}


//extension HomeVC: touchDelegate{
//
//    func touch() {
//        performSegue(withIdentifier: "SettingVC", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "SettingVC" {
//
//            let _: SettingVC = segue.destination as! SettingVC
//        }
//    }
//
//
//
//}
