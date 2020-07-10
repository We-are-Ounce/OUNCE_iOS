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
    
    let product1: Product? = nil
    
    
    private var productInformations:[Product] = []
    var rootVC: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        setProductList()
        //print(product1)
    }
    
    func setProductList(){
        let product1 = Product(company: "내추럴 발란스", product: "제품 이름", imgName: "icFavoriteSelected")
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! SearchCollectCell
        
        let PostStoryBoard: UIStoryboard = UIStoryboard(name: "Post", bundle: nil)
        let pvc = PostStoryBoard.instantiateViewController(identifier: "PostVC") as PostVC
       
        pvc.modalPresentationStyle = .fullScreen
        pvc.product = productInformations[indexPath.row]
        //pvc.text = cell.manufacturerName.text
        pvc.imageNameVC = productInformations[indexPath.row].foodImg
        pvc.companyNameVC = productInformations[indexPath.row].companyName
        pvc.productNameVC = productInformations[indexPath.row].itemName
        
        //pvc.backgroundView = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as? PostSC
        /*reviewView.imageName =  productInformations[indexPath.row].foodImg
        reviewView.company = productInformations[indexPath.row].companyName
        reviewView.product = productInformations[indexPath.row].itemName*/
        self.present(pvc, animated:true, completion: nil)
        
        
    }
    
}
