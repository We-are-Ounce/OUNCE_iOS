//
//  CustomTableViewCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

// MARK: - filter 클릭시 사용하려고 했던 customCell..."안씀"

//import UIKit
//
//class CustomTableViewCell: UITableViewCell {
//
//    lazy var backView: UIView = {
//
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 44))
//        return view
//
//    }()
//
//    lazy var label: UILabel = {
//        let label = UILabel(frame: CGRect(x: 60, y: 6, width: self.frame.width - 70, height: 25))
//        return label
//    }()
//
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        addSubview(backView)
//        backView.addSubview(label)
//
//
//    }
//
//}
