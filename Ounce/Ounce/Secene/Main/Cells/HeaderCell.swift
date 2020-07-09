//
//  HeaderCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import iOSDropDown

class HeaderCell: UITableViewCell {
    
    static let identifier: String = "HeaderCell"
    

    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sortingTextField: DropDown!
    @IBOutlet weak var filterBtn: UIButton!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()

          
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
