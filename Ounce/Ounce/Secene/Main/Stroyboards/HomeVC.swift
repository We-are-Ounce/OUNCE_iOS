//
//  HomeVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var reviewTV: UITableView!
    
    var stringList = ["주연", "주연","주연" ,"주연" ,"주연" ,"주연" ,"주연" ,"주연" ,"주연" ,"주연" ,"주연" ,"주연" ,"주연" ]
    

    
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
        //self.reviewTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        

    }
    
}



extension HomeVC : UITableViewDelegate {
    
}

extension HomeVC : UITableViewDataSource {
    
    // MARK: - TableView Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else {
            return stringList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            let profileCell = reviewTV.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            
            return profileCell
        }
        else{
            let reviewCell = reviewTV.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath)
            
            
            
            return reviewCell
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


