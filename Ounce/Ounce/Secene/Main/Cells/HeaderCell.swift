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
    
//    var transparentView = UIView()
    
//    var tableView = UITableView()
//
//    let height : CGFloat = 200
    
    
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sortingLabel: UILabel!
    @IBOutlet weak var filterBtn: UIButton!
    
    @IBOutlet weak var sortingBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func clickSorting(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)

        let dvc = sb.instantiateViewController(withIdentifier: "SortingVC") as! SortingVC

        dvc.modalPresentationStyle = .overFullScreen

        self.rootVC?.present(dvc, animated: false)
        
    }
        
       
    
  
    @IBAction func clickFilter(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = sb.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        
        dvc.modalPresentationStyle = .overFullScreen
        
        self.rootVC?.present(dvc, animated: false)
        
}

}
