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
        
        /*네비게이션 바 뒤로가기 버튼 타이틀 없애는 코드~~~참고하세요^^,,,왜 버튼아이템을 만들어줘야할까...존나빡쳐...개빡쳐...엑코 뒤져*/
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
       
        self.navigationItem.title = "기록하기"
       
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        setProductList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "기록하기"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = ""
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        //let backButton = UIBarButtonItem()
        //backButton.title = ""
        //self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    
        
    }
    func setProductList(){
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
        return CGSize(width: (collectionView.frame.width) / 2 ,height: (collectionView.frame.height)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 16, bottom: 8, right:16)
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
        print(#function)
        _ = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! SearchCollectCell
        let PostStoryBoard: UIStoryboard = UIStoryboard(name: "Post", bundle: nil)
        let pvc = PostStoryBoard.instantiateViewController(identifier: "PostVC") as PostVC
        //pvc.modalPresentationStyle = .fullScreen
        pvc.product = productInformations[indexPath.row]
        pvc.imageNameVC = productInformations[indexPath.row].foodImg
        pvc.companyNameVC = productInformations[indexPath.row].companyName
        pvc.productNameVC = productInformations[indexPath.row].itemName
        self.navigationController?.pushViewController(pvc, animated: true)
        // 네비게이션 이동. pvc view로 이동
    }
    
}
