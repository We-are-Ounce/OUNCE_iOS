//
//  PostVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostVC: UIViewController {

    @IBOutlet weak var addScrollView: UIScrollView!
   
  

    override func viewDidLoad() {
        super.viewDidLoad()
        let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
          self.addScrollView.addSubview(custom)

        setNavigationBar()
        self.navigationController?.navigationBar.tintColor = .greyish_brown // 네비게이션컨트롤러 뒤로가기 버튼 색깔 변경
              self.navigationController?.navigationBar.topItem?.title = "" //뒤로가기 버튼 텍스트 변경
        

        // Do any additional setup after loading the view.
    }
    
    func setNavigationBar(){
        
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
             bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                     bar.shadowImage = UIImage()
             bar.backgroundColor = UIColor.clear
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
