//
//  BrowseTabCVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then

class BrowseTabCVCell: UICollectionViewCell {
    static let reuseIdentifire = "TabBarCell"
    
    let titleLabel = UILabel().then {
        $0.font = Font.buttonLabel
        $0.textColor = .putty
    }
        
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .black
                titleLabel.font = Font.buttonLabel
            } else {
                titleLabel.textColor = .putty
                titleLabel.font = Font.buttonLabel
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.centerX.equalTo(contentView.snp.centerX)
            make.height.equalTo(25)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        isSelected = false
    }
}
