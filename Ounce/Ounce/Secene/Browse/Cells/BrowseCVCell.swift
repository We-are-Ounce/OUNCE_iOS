//
//  BrowseCVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class BrowseCVCell: UICollectionViewCell {
    let customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()

    let imgCatView = UIImageView()
    let imgRecommandFirst = UIImageView()
    let imgRecommandSecond = UIImageView()
    let imgRecommandThird = UIImageView()
    let imgRecommandFourth = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initial()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

} //End of CardCell
