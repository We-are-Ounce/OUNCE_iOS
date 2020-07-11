//
//  PageCVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PageCVC: UICollectionViewCell {
    static let reuseIdentifier = "TabPageCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
