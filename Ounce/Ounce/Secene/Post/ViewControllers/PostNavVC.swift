//
//  PostNavVC.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.topItem?.title = "기록하기"
        // Do any additional setup after loading the view.
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.topItem?.title = ""

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
