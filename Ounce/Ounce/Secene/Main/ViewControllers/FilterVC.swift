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

extension FilterVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        
        let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as! FilterCVC
        
        if indexPath.section == 0 {
            cell.filterBtn.setTitle(dryList[indexPath.row], for: .normal)
            return cell
        }
            
        else if indexPath.section == 1 {
            cell.filterBtn.setTitle(menuList[indexPath.row], for: .normal)
            return cell
        }
            
        else{
            cell.filterBtn.setTitle(manufactureList[indexPath.row], for: .normal)
            return cell
        }
    }
    
    // collectionView Cell의 "위치" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 0)
        }
        else if section == 1 {
            
            return UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 0)
        }
            
        else {
            return UIEdgeInsets(top: 0, left: 16, bottom: 10, right:0)
        }
        
    }
    
    // collectionVeiw Cell의 "크기" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        //        return CGSize(width: 60, height: 100)
        
        if filterCollectionView.numberOfSections == 0 {
            
            return CGSize(width: 52, height: 10)
        }
            
        else if filterCollectionView.numberOfSections == 1 {
            
            return CGSize(width: 52, height: 28)
        }
            
        else{
            
            return CGSize(width: 52, height: 28)
        }
    }
    
    
    
    // MARK: - collectionView section Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//
//            if FilterHeaderCell
////
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! FilterHeaderCell
//            headerView.titleLabel.text = "주재료"
//            headerView.titleLabel.textColor = .brownGrey
//
//            return headerView
            
            //            else if indexPath.section == 2 {
            //                headerView.titleLabel.text = "제조사"
            //                return headerView
            //            }
            //            else {
            //                let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
            //                let myView = UICollectionReusableView(frame: rect)
            //
            //                return myView
            
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FilterSecondHeader", for: indexPath) as! FilterSecondHeader
//                       header.secondLabel.text = "제조사"
//                       header.secondLabel.textColor = .brownGrey
//
//                       return header
            
//        case UICollectionView.elementKindSectionFooter:
//        default:
//
//            assert(false, "Unexpected element kind")
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! FilterHeaderCell
//            headerView.titleLabel.text = "제조사"
//            return headerView
     //   }
        
        if kind == UICollectionView.elementKindSectionHeader {
            
           let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FilterHeaderCell", for: indexPath) as! FilterHeaderCell
                      headerView.titleLabel.text = "주재료"
                      headerView.titleLabel.textColor = .brownGrey
                      
                      return headerView
         

         } else {
            
           assert(false, "Unexpected element kind")

         }
        
    }
}
