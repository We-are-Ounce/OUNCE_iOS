//
//  PostVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostVC: UIViewController,UITextViewDelegate, UITextFieldDelegate {
    
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
        custom.criticTextField.delegate = self
        custom.memoTextView.delegate = self
        addScrollView.delegate = self
        addKeyboardNotification()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),name: .KeyboardWillShowNotification, object: nil)
        //
        //
        //
        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHideNotification, object: nil)
        //
        //            }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            textField.resignFirstResponder()
            
            return true
            
        }
        
        func keyboardWillShow(_ sender: Notification) {
            
            self.view.frame.origin.y = -150 // Move view 150 points upward
            
        }
        
        func keyboardWillHide(_ sender: Notification) {
            
            self.view.frame.origin.y = 0 // Move view to original position
            
        }
        
        
        
        
        // Do any additional setup after loading the view.
        //addKeyboardObserver()
        //closeKeyboardObserver()
        
    }
    
    
    
    /*
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
     self.backgroundView.transform = .identity
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
     self.backgroundView.transform = .init(translationX: 0, y: -300)
     })
     }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     print(#function)
     self.backgroundView.endEditing(true)
     }
     }*/
    
}

extension PostVC {
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification)  {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardHeight = keyboardFrame.height
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let bottomPadding = keyWindow?.safeAreaInsets.bottom

            var contentInset:UIEdgeInsets = self.addScrollView.contentInset
            contentInset.bottom = keyboardHeight - (bottomPadding ?? 0)

            addScrollView.contentInset = contentInset
            addScrollView.scrollToBottom()

            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardHeight = keyboardFrame.height
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let bottomPadding = keyWindow?.safeAreaInsets.bottom

            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            addScrollView.contentInset = contentInset
            
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }

}

extension PostVC: UIScrollViewDelegate {
    

}
