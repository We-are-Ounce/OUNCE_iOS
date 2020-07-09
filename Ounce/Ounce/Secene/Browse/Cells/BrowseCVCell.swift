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
    
//    let customView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 12
//        return view
//    }()
    
    let customView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    let imgCatView = UIImageView().then {
        $0.backgroundColor = .white
    }
    
    let labelName = UILabel().then {
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.text = "가을이"
    }
    
    let labelCoincidence = UILabel().then {
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.text = "77% 일치"
    }
    
    let stackViewLabel = UIStackView().then {
        
        let firstRecommandImg = UIImageView().then {
            $0.backgroundColor = .brownGreyColor
        }
        
        let secondRecommandImg = UIImageView().then {
            $0.backgroundColor = .purple
        }
        let thirdRecommandImg = UIImageView().then {
            $0.backgroundColor = .red
        }
        $0.addArrangedSubview(firstRecommandImg)
        $0.addArrangedSubview(secondRecommandImg)
        $0.addArrangedSubview(thirdRecommandImg)
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 9
    }
    
    
    
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
