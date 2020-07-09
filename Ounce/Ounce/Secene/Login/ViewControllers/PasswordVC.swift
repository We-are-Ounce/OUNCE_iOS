//
//  PasswordVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import CHIPageControl

class PasswordVC: UIViewController {
    
    // MARK: - UI components
    
    let guideLabel = UILabel().then{
        $0.font = Font.signUpSmallGuideLabel
        $0.alpha = 0
    }
    
    let pwGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "비밀번호"
        $0.alpha = 0
    }
    
    let pwTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "5자리 이상 입력해주세요."
        $0.isSecureTextEntry = true
        $0.alpha = 0
    }
    
    let pwUnderBarView = UIView().then {
        $0.backgroundColor = .brownGreyColor
        $0.alpha = 0
    }
    
    let pwErrorGuiedLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.textColor = .pinkishColor
        $0.text = "비밀번호 조건이 일치하지 않습니다."
        $0.alpha = 0
    }
    
    let pwCertificationGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "비밀번호 재확인"
        $0.alpha = 0
    }
    
    let pwCertificationTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "5자리 이상 입력해주세요."
        $0.isSecureTextEntry = true
        $0.alpha = 0
    }
    
    let pwCertificationUnderBarView = UIView().then {
        $0.backgroundColor = .brownGreyColor
        $0.alpha = 0
    }

    let pwCertificationErrorGuiedLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.text = "비밀번호가 일치하지 않습니다."
        $0.textColor = .pinkishColor
        $0.alpha = 0
    }
    
    let nextButton = UIButton().then{
//        $0.isEnabled = false
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
        $0.set(progress: 1, animated: false)
    }

    
    // MARK: - Variables and Properties
    var email: String?
    var id: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        setLabel()
        setNav()
        addKeyboardNotification()
        setTextField()
        pageControl.set(progress: 2, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        initAnimate()
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

extension PasswordVC {

    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc func tapNextButton() {
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "SignUpCompleteVC") as? SignUpCompleteVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.present(vc!, animated: false)
    }
    
    func setTextField(){
        pwTextField.delegate = self
        pwTextField.addTarget(self,
                              action: #selector(PasswordVC.textFieldDidChange(_:)),
                              for: .editingChanged)
        pwCertificationTextField.delegate = self
        pwTextField.addTarget(self,
                          action: #selector(PasswordVC.textFieldDidChange(_:)),
                          for: .editingChanged)
    }
}

extension PasswordVC: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if pwTextField.text?.validatePassword() != true {
            pwErrorGuiedLabel.alpha = 1
            pwUnderBarView.backgroundColor = .pinkishColor
        } else {
            pwErrorGuiedLabel.alpha = 0
            pwUnderBarView.backgroundColor = .battleshipGrey
        }
        
        if pwTextField.text != pwCertificationTextField.text {
            pwCertificationErrorGuiedLabel.alpha = 1
            pwCertificationUnderBarView.backgroundColor = .pinkishColor
        } else {
            pwCertificationErrorGuiedLabel.alpha = 0
            pwCertificationUnderBarView.backgroundColor = .pinkishColor
        }
    }
}

extension PasswordVC {
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
                        self.pwGuideLabel.alpha = 1
                        self.pwGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.pwTextField.alpha = 1
                        self.pwTextField.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.pwUnderBarView.alpha = 1
                        self.pwUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.pwCertificationGuideLabel.alpha = 1
                        self.pwCertificationGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.pwCertificationTextField.alpha = 1
                        self.pwCertificationTextField.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.pwCertificationUnderBarView.alpha = 1
                        self.pwCertificationUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: 0)
        })
    }
    
    func isEditing(_ keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.nextButton.transform = CGAffineTransform(translationX: 0,
                                                                           y: -keyboardHeight)
//                        self.firstPageControllView.transform = CGAffineTransform(translationX: 0,
//                                                                                y: -keyboardHeight)
//                        self.secondPageControllView.transform = CGAffineTransform(translationX: 0,
//                                                                                y: -keyboardHeight)
//                        self.thirdPageControllView.transform = CGAffineTransform(translationX: 0,
//                                                                                 y: -keyboardHeight)
        }, completion: nil)
    }

    func endEditing() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.nextButton.transform = .identity
//                        self.firstPageControllView.transform = .identity
//                        self.secondPageControllView.transform = .identity
//                        self.thirdPageControllView.transform = .identity
        }, completion: nil)
    }

}

extension PasswordVC {
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

