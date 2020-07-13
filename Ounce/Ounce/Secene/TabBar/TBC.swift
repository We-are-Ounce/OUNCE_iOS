//
//  Tabbar.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class TBC: UITabBarController {
    
    let tabBarNormalImages = ["icHomeUnselected",
                              "icLookUnselected"]
    let tabBarSelectedImages = ["icHomeSelected",
                                "icLookSelected"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab = CustomTabBar()
        tab.addDelegate = self
        self.setValue(tab, forKey: "tabBar")
        UITabBar.clearShadow()
        self.tabBar.layer.applyShadow(color: .gray, alpha: 0.2, x: 0, y: 1, blur: 10)
    }
    
    func addClick() {
        let sb = UIStoryboard(name: "Post", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PostNavVC") as! PostNavVC
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    
//    func setRootTabbarConntroller(){
//
//        var vc : UIViewController?
//
//        for i in 0..<self.tabBarNormalImages.count {
//
//            //Create the root controller
//            switch i {
//            case 0:
//                vc = MainVC()
//            case 1:
//                vc = BrowseVC()
//            default:
//                break
//            }
            
            //Creating Navigation Controller
            //            let nav = RootNavigationController.init(rootViewController: vc!)
            
            //1. Create tabbarItem
//            let barItem = UITabBarItem.init(title: nil,
//                                            image: UIImage(named: self.tabBarNormalImages[i])?.withRenderingMode(.alwaysOriginal),
//                                            selectedImage: UIImage(named: self.tabBarSelectedImages[i])?.withRenderingMode(.alwaysOriginal))
            
            //2. Change font color
//            barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .normal)
//            barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .selected)
            
            
//            Setting titles
//            vc?.title = self.tabBarTitles[i]
            //Setting Root Controller
//            vc?.tabBarItem = barItem
            
            //            Add to the current controller
            //            self.addChild(nav)
//        }
//    }
    
}

extension TBC : RootTabBarDelegate{
    
}
