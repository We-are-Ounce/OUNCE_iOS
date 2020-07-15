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
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        self.backgroundDismiss()

    }
    
    func backgroundDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(_:))))
    }
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
        
    }
    
}
//
//extension FilterVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//
//    // 각각의 collection view별로 분기 처리
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if section
//
//
//    }
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
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
//
//        else if collectionView == self.PageCollectionView{
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell",for:indexPath) as! PageCell
//
//            let pageCell = RecommendPageDataSet[indexPath.row]
//
//            cell.TitleLabel.text = pageCell.pageName
//            cell.subTitleLabel.text = pageCell.pageDetail
//
//            let urlStr = pageCell.pageImg
//
//            cell.PageImg.kf.setImage(with: URL(string: urlStr))
//
//            return cell
//
//        }
//
//        else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BandCell",for:indexPath) as! BandCell
//
//            let bandCell = RecommendBandDataSet[indexPath.row]
//
//            cell.titleLabel.text = bandCell.bandName
//            cell.numberLabel.text = bandCell.bandNumOfMember
//            cell.nameLabel.text = bandCell.userNickname
//
//            let urlStr = bandCell.bandImg
//
//            cell.BandImg.kf.setImage(with: URL(string: urlStr))
//
//            return cell
//        }
//
//    }
//
//
//    // collectionView Cell의 "위치" 조정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        if collectionView == self.NewCollectionView{
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
//        }
//
//        else if collectionView == self.PageCollectionView{
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
//        }
//
//        else {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
//        }
//    }
//
//
//    // collectionVeiw Cell의 "크기" 조정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
//        indexPath: IndexPath) -> CGSize {
//
//        if collectionView == self.NewCollectionView{
//            return CGSize(width: (collectionView.frame.width - 70) / 2, height: (collectionView.frame.height - 12)/2)
//        }
//        else if collectionView == self.PageCollectionView{
//            return CGSize(width: (collectionView.frame.width - 44), height: (collectionView.frame.height - 52)/3)
//        }
//
//        else{
//            return CGSize(width: (collectionView.frame.width - 120), height: (collectionView.frame.height))
//        }
//    }
//}
//
//// 검색 클릭시 키보드 생성 + background 클릭시 키보드 제거
//extension SearchViewController:UITextFieldDelegate {
//
//    private func addKeyboardObserver() {
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #sel
