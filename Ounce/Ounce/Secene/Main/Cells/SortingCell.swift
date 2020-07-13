//
//  SortingCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then
import SnapKit

class SortingCell: UITableViewCell {
    
    let sortLabel = UILabel().then {
        $0.textColor = .putty
        $0.text = "12312312"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func constraint(){
        contentView.addSubview(sortLabel)
        
        sortLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.centerX.equalToSuperview()
        }
    }
}
