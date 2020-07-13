////
////  SortingVC.swift
////  Ounce
////
////  Created by 박주연 on 2020/07/10.
////  Copyright © 2020 박주연. All rights reserved.
////
//
import UIKit

class SortingVC: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var popView: UIView!
    
    @IBOutlet weak var sortingTV: UITableView!
    @IBOutlet weak var touchView: UIView!
    
    var sortingList = ["날짜순", "기호도순", "총점순"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortingTV.delegate = self
        sortingTV.dataSource = self
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.backgroundDismiss()
        
//        self.sortingTV.separatorStyle = UITableViewCell.SeparatorStyle.none
     
    }
    
    // MARK: - 아래서 위로 올라오는 그런 뷰,,
    func backgroundDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(_:))))
    }
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
        
    }
}

extension SortingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let sortingCell = sortingTV.dequeueReusableCell(withIdentifier: "SortingCell", for: indexPath) as? SortingCell else{return UITableViewCell()}
        
        return sortingCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         return 44
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return sortingList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // indexPath row 별로 데이터 보내기
    }
    
}
