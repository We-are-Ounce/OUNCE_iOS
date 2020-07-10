//
//  HeaderCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    static let identifier: String = "HeaderCell"
    
    var  rootVC: UIViewController?
    

    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sortingLabel: UILabel!
    @IBOutlet weak var filterBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

          
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func clickFilter(_ sender: Any) {
        
    let MainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

//     let pvc = MainStoryBoard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        
//        pvc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//
//        self.present(pvc, animated: true, completion:nil)
        
        let dvc = MainStoryBoard.instantiateViewController(identifier: "FilterVC") as! FilterVC

        dvc.modalPresentationStyle = .overCurrentContext

        self.rootVC?.present(dvc, animated: true, completion: nil)

        
        
        
    }
}

