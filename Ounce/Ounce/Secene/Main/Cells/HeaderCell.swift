//
//  HeaderCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import DropDown

class HeaderCell: UITableViewCell {
    
    static let identifier: String = "HeaderCell"
    
    var dropDown:DropDown?
    
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sortingBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    
    
    @objc func dropDownButton(){
        
        dropDown?.show()
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        dropDown = DropDown()
        dropDown?.anchorView = sortingBtn
        dropDown?.dataSource = ["기호도 순", "추천 순", "날짜 순"]
        sortingBtn.addTarget(self, action: #selector(dropDownButton), for: .touchUpInside)
        
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in self.sortingBtn.setTitle(item, for: .normal)
        }
          
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
