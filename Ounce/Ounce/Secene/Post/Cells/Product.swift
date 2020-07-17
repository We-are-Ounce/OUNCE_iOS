//
//  Product.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

struct Product{
    
    var foodImg: UIImage?
    var companyName: String
    var itemName: String
    
    init(company: String, product: String, imgName: String){
        
        self.foodImg = UIImage(named:imgName)
        self.companyName = company
        self.itemName = product
    }
    
}
