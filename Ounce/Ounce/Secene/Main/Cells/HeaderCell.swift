//
//  HeaderCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/08.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell, UIViewControllerTransitioningDelegate {
    
    static let identifier: String = "HeaderCell"
    
    var  rootVC: UIViewController?
    
    var transparentView = UIView()
    var tableView = UITableView()
    
    let height : CGFloat = 200
    
    
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
        
        print(#function)
        
         let MainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
              let dvc = MainStoryBoard.instantiateViewController(withIdentifier: "SortingVC") as! SortingVC
   
        dvc.definesPresentationContext = true
        dvc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        dvc.transitioningDelegate = self
        
        dvc.view.backgroundColor = UIColor.darkGray
        
      self.rootVC?.present(dvc, animated: true, completion: nil)
        
        self.rootVC?.preferredContentSize = CGSize(width: 375, height: 200)
        }
    
    
  
    @IBAction func clickFilter(_ sender: Any) {
        
       // let MainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //     let pvc = MainStoryBoard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        
        //        pvc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //
        //        self.present(pvc, animated: true, completion:nil)
        
//      
//      let dvc = MainStoryBoard.instantiateViewController(identifier: "FilterVC") as! FilterVC
//        
////        dvc.modalPresentationStyle = .fullScreen
//        
////        self.rootVC?.present(dvc, animated: true, completion: nil)
//        
//        dvc.definesPresentationContext = true
//             
////        dvc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        
//        
////               dvc.transitioningDelegate = self
//               
//        dvc.view.backgroundColor = .darkPeach
//               
//               self.rootVC?.present(dvc, animated: true, completion: nil)
//               
////        self.rootVC?.preferredContentSize = CGSize(width: 375, height: 100)
//        
//        
//        
//        dvc.modalPresentationStyle = .overFullScreen
//       dvc.modalTransitionStyle = .crossDissolve
//        
    
        
//         self.rootVC?.present(dvc, animated: true, completion: nil)
        
        
        
        
//        let MainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//             let pvc = MainStoryBoard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
//        
        
        
        print(#function)
        let window = UIApplication.shared.keyWindow
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        transparentView.frame = CGRect(x: 0, y: transparentView.frame.height, width: transparentView.frame.width, height: 150)
        
        window?.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        
        window?.addSubview(tableView)
        
        
        transparentView.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))

        transparentView.addGestureRecognizer(tapGesture)

        transparentView.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {self.transparentView.alpha = 0.5; self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height) }, completion: nil)
    }

    @objc func onClickTransparentView(){

        let screenSize = UIScreen.main.bounds.size

         UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0; self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height) }, completion: nil)

    }
}

