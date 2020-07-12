//
//  SearchCollectCell.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SearchCollectCell: UICollectionViewCell{
    
    
    static let identfier = "productCell"
    
    var rootVC: UIViewController?
    
   
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var manufacturerName: UILabel!
    
    func set(_ productInfo: Product){
        productImageView.image = productInfo.foodImg
        productName.text = productInfo.itemName
        manufacturerName.text = productInfo.companyName
    }
    
    
    
    
    
}
