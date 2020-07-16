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
    
    //    var DryList : [Dry] = []
    
    var dryList = ["건식", "습식"]
    
    var menuList = ["연어", "칠면조", "소", "닭", "양", "토끼", "오리", "참치", "돼지", "해산물", "사슴", "캥거루", "기타"]
    
    var manufactureList = ["Go!", "캣츠파인푸드", "테라펠리스", "로얄캐닌", "내추럴발란스", "질랜디아", "나우", "생식본능", "카루", "웰츠", "퍼시캣", "헤일로", "뉴트로", "지위픽", "웰니스", "어딕션", "내추럴플래닛", "블랙우드", "로우즈", "보레알", "아보덤", "K9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        self.backgroundDismiss()
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        
     
    }
    
    func backgroundDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(_:))))
    }
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
        
    }
    
}

extension FilterVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSectionsInCollectionView(in collectionView: UICollectionView!) -> Int {
        return 3
    }
    
    // 각각의 collection view별로 분기 처리
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return dryList.count
        }
        
        if section == 1 {
            
            return menuList.count
        }
            
        else {
            return manufactureList.count
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //        if collectionView == self.NewCollectionView{
        //
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell",for:indexPath) as! NewCell
        //
        //            let newCell = NewBandDataSet[indexPath.row]
        //
        //            cell.Label.text = newCell.bandName
        //
        //            let urlStr = newCell.bandImg
        //
        //            cell.NewImg.kf.setImage(with: URL(string: urlStr))
        //
        //            print(newCell)
        //
        //            return cell
        //        }
        
        if indexPath.section == 0 {
            
            let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as! FilterCVC

            return cell
            
//            guard let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCVC.identifier, for: indexPath) as? FilterCVC else { return UICollectionViewCell() }
//
//            FilterCVC.set(dryList[indexPath.row])
//            return cell

            
        }
        else if indexPath.section == 1 {
            
            let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as! FilterCVC
            
            return cell
        }
            
        else{
            
            let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as! FilterCVC
            
            return cell
            
        }
    }
    
    // collectionView Cell의 "위치" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if filterCollectionView.numberOfSections == 0 {
            return UIEdgeInsets(top: 0, left: 3, bottom: 10, right: 3)
        }
        else if filterCollectionView.numberOfSections == 1 {
            
            return UIEdgeInsets(top: 0, left: 3, bottom: 10, right: 3)
        }
            
        else {
            
            return UIEdgeInsets(top: 0, left: 3, bottom: 10, right: 3)
        }
        
    }
    
    
    // collectionVeiw Cell의 "크기" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {

        if filterCollectionView.numberOfSections == 0 {
            
            return CGSize(width: 52, height: 28)
        }
            
        else if filterCollectionView.numberOfSections == 1 {
            
            return CGSize(width: 52, height: 28)
        }
            
        else {
            
            return CGSize(width: 52, height: 28)
            
        }
    }
    
}
