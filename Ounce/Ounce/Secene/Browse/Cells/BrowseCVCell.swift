//
//  BrowseCVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit
import Then

class BrowseCVCell: UICollectionViewCell {
    
    let customView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    let imgCatView = UIImageView().then {
        //$0.contentMode = .scaleToFill
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .white
        $0.setRounded(radius: 45)
    }
    
    let labelName = UILabel().then {
        $0.textColor = .greyishBrown
        $0.backgroundColor = .white
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        $0.text = "가을이"
    }
    
    let labelCoincidence = UILabel().then {
        $0.backgroundColor = .white
        $0.textColor = .brownGrey
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.text = "77% 일치"
        
    }
    
    
    let firstRecommandImg = UIImageView().then {
        $0.backgroundColor = .white
    }
    
    let secondRecommandImg = UIImageView().then {
        $0.backgroundColor = .white
    }
    let thirdRecommandImg = UIImageView().then {
        $0.backgroundColor = .white
    }
    




    // MARK - Variable, Properties
    
    var recommendInfo: Recommend?
    var item: [String] = ["","",""]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initial()
        

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    
    

}
