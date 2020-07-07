//
//  SearchCollectVC.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SearchCollectVC: UIViewController{
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    @IBOutlet weak var manufacturerName: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    
    private var productInformations:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        setProductList()
    }
    
    private func setProductList(){
        let product1 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "imgFoodRecord")
        let product2 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "imgFoodRecord")
        let product3 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "imgFoodRecord")
        let product4 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "imgFoodRecord")
        let product5 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "imgFoodRecord")
        let product6 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "imgFoodRecord")
        productInformations = [product1,product2,product3,product4,product5,product6]
        
    }
}

extension SearchCollectVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productInformations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectCell.identfier, for: indexPath) as? SearchCollectCell else {return UICollectionViewCell()}
        itemCell.set(productInformations[indexPath.row])
        return itemCell
    }
}

extension SearchCollectVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
