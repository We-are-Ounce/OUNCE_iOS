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
    
    var text: String?
    var product: Product? //구조체
    var imageNameVC: UIImage?
    var companyNameVC: String?
    var productNameVC: String?
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

     
        self.navigationItem.title = "기록하기"
       
//        view.backgroundColor = .blue
//        self.navigationItem.backBarButtonItem?.title = ""
//        let backButton = UIBarButtonItem()
//        backButton.title = ""
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        
        
        let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
        
        custom.companyName.text = companyNameVC
        custom.productName.text = productNameVC
        custom.productImg.image = imageNameVC
        self.addScrollView.addSubview(custom)
        custom.viewDidLoad()
        custom.rootVC = self
        custom.criticTextField.delegate = self
        custom.memoTextView.delegate = self
        
        addScrollView.delegate = self
        addKeyboardNotification()
        
        /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            textField.resignFirstResponder()
            
            return true
            
        }
        
        func keyboardWillShow(_ sender: Notification) {
            
            self.view.frame.origin.y = -150 // Move view 150 points upward
            
        }
        
        func keyboardWillHide(_ sender: Notification) {
            
            self.view.frame.origin.y = 0 // Move view to original position
            
        }
        */
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let rightButton = UIBarButtonItem()
        //rightButton.title = "완료"
        rightButton.image = UIImage(named:"icMore")
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton
        rightButton.action = #selector(editButtonDidTap)
        rightButton.target = self
        
    
        // 중간수정버튼 만들기
        
    }
    
    @objc private func editButtonDidTap(){
        
        let settingAlert = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
       
        let firstAction = UIAlertAction(title: "수정", style: .default, handler: nil)
       
        let secondAction = UIAlertAction(title: "삭제", style: .destructive, handler: nil)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        
        settingAlert.addAction(firstAction)
        settingAlert.addAction(secondAction)
        settingAlert.addAction(cancelAction)
        settingAlert.view.tintColor = UIColor.black
        
        present(settingAlert,animated: true,completion: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
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

extension PostVC: UITextViewDelegate{
    
}

extension PostVC: UITextFieldDelegate{
    
}
