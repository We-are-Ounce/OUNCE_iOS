//
//  IDVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import CHIPageControl

class IDVC: UIViewController {
    
    // MARK: - UI components
    
    let guideLabel = UILabel().then{
        $0.font = Font.signUpSmallGuideLabel
        $0.alpha = 0
    }
    
    let idGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "아이디"
        $0.alpha = 0
    }
    
    let idTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "5자리 이상 입력해주세요."
        $0.alpha = 0
    }
    
    let idUnderBarView = UIView().then {
        $0.backgroundColor = .signatureColor
        $0.alpha = 0
    }
    
    let idErrorGuiedLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.alpha = 0
        $0.textColor = .pinkishColor
        $0.text = "5자리 이상 입력해주세요."
    }
    
    let nextButton = UIButton().then{
        $0.backgroundColor = .signatureColor
        $0.setRounded(radius: 8)
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = Font.dateLabel
        $0.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
    }
    
    let pageControl = CHIPageControlAji().then {
        $0.numberOfPages = 3
        $0.radius = 5
        $0.currentPageTintColor = .battleshipGrey
        $0.tintColor = .brownGreyColor
        
    }

    
    // MARK: - Variables and Properties
    
    var email: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        constraint()
        setNav()
        addKeyboardNotification()
        pageControl.set(progress: 1, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewAnimate()
    }
    
    func setLabel(){
        let attrString = NSMutableAttributedString(string: "회원가입을 위한 \n정보를 입력해주세요")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
    
    
}

extension IDVC {
    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc func tapNextButton() {
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "PasswordVC") as? PasswordVC
        
        vc?.email = email
        vc?.id = idTextField.text
        
        self.navigationController?.pushViewController(vc!, animated: false)
    }
}

extension IDVC {
    
    func viewAnimate(){
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.85,
                       initialSpringVelocity: 1,
                       options: [.curveEaseIn],
                       animations: {
                        // self를 항상 붙여줘야함 (클로저 안에서)
                        self.guideLabel.alpha = 1
                        self.guideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.idGuideLabel.alpha = 1
                        self.idGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.idTextField.alpha = 1
                        self.idTextField.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.idUnderBarView.alpha = 1
                        self.idUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: 0)

                        
        })

    }
    
    func isEditing(_ keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.nextButton.transform = CGAffineTransform.init(translationX: 0, y: -keyboardHeight)
        }, completion: nil)
    }

    func endEditing() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.guideLabel.alpha = 1
                        
                        self.nextButton.transform = .identity
        }, completion: nil)
    }
}

extension IDVC {
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
            
            isEditing((keyboardHeight - (bottomPadding ?? 0)))
            
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
            
            endEditing()
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}
