//
//  SearchVC.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SearchVC: UIViewController{
    
    @IBOutlet weak var movePostView: UIButton!
    
    
//    lazy leftBarItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: nil, action: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        /*movePostView.addTarget(self,
                               action: #selector(didTapMoveButton),
                               for: .touchUpInside)*/
        
    }
    
    @IBAction func downBarButton(_ sender: Any) {
    // 뒤로가기.(화면 아래로 내려가는 액션)
        self.dismiss(animated: true, completion: nil)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //self.navigationItem.title = "기록하기"
        
    }
//    @objc func downBarButton(_ sender: Any) {
//    // 뒤로가기.(화면 아래로 내려가는 액션)
//        self.dismiss(animated: true, completion: nil)
//    
//    }
    /* @objc func didTapMoveButton(){
        print(#function)
        let sb = UIStoryboard(name: "Post", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PostVC") as! PostVC

        
        self.navigationController?.pushViewController(vc, animated: true)*/

//        self.present(showDetailNewsFeedVC, animated: true, completion: nil)
    }
    
    



extension SearchVC {
    func setNav(){
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.navigationController?.navigationBar.topItem?.title = ""
        //self.navigationItem.backBarButtonItem?.title = ""
        self.navigationItem.title = "기록하기"
    }
}
