//
//  SortingListVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/15.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

final class SortingListVC: UIViewController {

    let backgroundButton = UIButton().then {
        $0.backgroundColor = .black
        $0.alpha = 0.3
    }
    
    let sortingView = UIView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

}

extension SortingListVC {
    func constraint(){
        
    }
}
