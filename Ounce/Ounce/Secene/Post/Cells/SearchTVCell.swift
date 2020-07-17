//
//  SearchTVCell.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/15.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SearchTVCell: UITableViewCell {
    
    @IBOutlet weak var traceLabel: UILabel!
    @IBOutlet weak var underBar: UIView!
    
    var recode: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        traceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        underBar.backgroundColor = .white
        underBar.alpha = 0.4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
