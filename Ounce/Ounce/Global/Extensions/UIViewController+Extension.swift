//
//  UIViewController+Extension.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/03.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    // 2칸인 alert title - up, message - down
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default) { (action) in
            
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // 예 버튼을 누를때 핸들러로 핸들링하는 Alert with cancel
    func simpleAlertWithHandler(title: String, msg: String?, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "아니오", style: .default)
        let noAction = UIAlertAction(title: "예", style: .destructive, handler: handler)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true)
    }
    
    func normalAlertWithHandler(title: String, msg: String?, okTitle: String, noTitle: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let noAction = UIAlertAction(title: noTitle, style: .default)
        let okAction = UIAlertAction(title: okTitle, style: .destructive, handler: handler)

        alert.addAction(noAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    func oneAlertWithHandler(title: String, msg: String?, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .cancel, handler: handler)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    // 예 버튼을 누를때 핸들러로 핸들링하는 Alert without cancel
    func simpleDismissAlert(title: String, msg: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .cancel, handler: handler)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
}
