//
//  TabCVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class TabCVC: UICollectionViewCell {
    static let identifier = "TabBarCell"
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .signatureColor
                titleLabel.font = UIFont.systemFont(ofSize: 20,weight: UIFont.Weight.thin)
            } else {
                titleLabel.textColor = .veryLightPink
                titleLabel.font = UIFont.systemFont(ofSize: 20)
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

    //이것의 기능은 무엇인지..
    override func prepareForReuse() {
        isSelected = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
