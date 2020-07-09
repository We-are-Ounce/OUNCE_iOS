//
//  PostVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    //    @IBAction func out(_ sender: Any) {
    //        self.dismiss(animated: true, completion: nil)
    //    }
    
    @IBOutlet weak var addScrollView: UIScrollView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //self.setNavigationBar()
        self.navigationController?.navigationBar.tintColor = .greyish_brown // 네비게이션컨트롤러 뒤로가기 버튼 색깔 변경
        self.navigationController?.navigationBar.topItem?.title = "" //뒤로가기 버튼 텍스트 변경
        let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
        self.addScrollView.addSubview(custom)
        custom.viewDidLoad()
        custom.rootVC = self
        // Do any additional setup after loading the view.
        
        addKeyboardObserver()
        closeKeyboardObserver()
        
    }
    
}

extension PostVC: UITextFieldDelegate {
    
    private func addKeyboardObserver() {
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.addScrollView.transform = .identity
        })
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        //let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey]as! NSValue).cgRectValue
        //let keyWindow = UIApplication.shared.connectedScenes
        //let bottomPadding = keyWindow?.safeAreaInsets.bottom
        //let keyboardHeight = keyboardFrame.height
        //bottomConstraint.constant = (keyboardHeight)
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.addScrollView.transform = .init(translationX: 0, y: -300)
            
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        self.addScrollView.endEditing(true)
    }
    
    
    
}


