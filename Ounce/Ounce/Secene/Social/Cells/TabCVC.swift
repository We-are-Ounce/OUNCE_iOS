//
//  TabCVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/10.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class TabCVC: UICollectionViewCell {
    static let reuseIdentifier = "TabbarCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    
    
}
