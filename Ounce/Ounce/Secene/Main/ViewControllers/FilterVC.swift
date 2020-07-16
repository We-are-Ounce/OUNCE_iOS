//
//  FilterVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/09.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var backImg: UIView!
    @IBOutlet weak var touchView: UIView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var manuCollectionView: UICollectionView!
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var dryList = ["건식", "습식"]
    
    var menuList = ["연어", "칠면조", "소", "닭", "양", "토끼", "오리", "참치", "돼지", "해산물", "사슴", "캥거루", "기타"]
    
    var manufactureList = ["Go!", "캣츠파인푸드", "테라펠리스", "로얄캐닌", "내추럴발란스", "질랜디아", "나우", "생식본능", "카루", "웰츠", "퍼시캣", "헤일로", "뉴트로", "지위픽", "웰니스", "어딕션", "내추럴플래닛", "블랙우드", "로우즈", "보레알", "아보덤", "K9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        self.backgroundDismiss()
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        manuCollectionView.delegate = self
        manuCollectionView.dataSource = self
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let collectionViewLayout = filterCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout?.invalidateLayout()
    }
    func backgroundDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(_:))))
    }
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension FilterVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // 각각의 collection view별로 분기 처리
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.filterCollectionView{ return dryList.count}
        else if collectionView == self.foodCollectionView{return menuList.count}
        
        return manufactureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.filterCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DryCVC",for:indexPath) as! DryCVC
            
            cell.dryLabel.setTitle(dryList[indexPath.row], for: .normal)
            
            return cell
        }
            
        else if collectionView == self.foodCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCVC",for:indexPath) as! FoodCVC
            
            cell.foodLabel.setTitle(menuList[indexPath.row], for: .normal)
            
            
            return cell
            
        }
            
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ManuCVC",for:indexPath) as! ManuCVC
            
            cell.manuLabel.setTitle(manufactureList[indexPath.row], for: .normal)
            
            return cell
        }
    }
    
    
    // collectionView Cell의 "위치" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.filterCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        }
            
        else if collectionView == self.foodCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
            
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
    }
    
    
    // collectionVeiw Cell의 "크기" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.filterCollectionView{
            return CGSize(width: 50, height: 28)
        }
        else if collectionView == self.foodCollectionView{
            return CGSize(width: 60, height: 28)
        }
            
        else{
            return CGSize(width:98, height: 28)
        }
    }
}



