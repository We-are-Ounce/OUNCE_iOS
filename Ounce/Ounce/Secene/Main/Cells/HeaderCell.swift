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

    @IBOutlet weak var dropDown: DropDown!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        drop()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    func drop() {

        let dropdown = DropDown(frame: CGRect(x:400, y: 150, width: 128, height: 60))

        dropdown.optionArray = ["추천 순", "기호도 순", "날짜 순"]
        dropdown.optionIds = [1,2,3,4]
        
        dropdown

//        dropdown.didSelect{(selectedText , index ,id) in
//        self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
//            }
    }
    
    
    @IBAction func dropDown(_ sender: Any) {
   
        
    }
    
}
