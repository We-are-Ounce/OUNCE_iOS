//
//  EmailVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import CHIPageControl
import Then

class EmailVC: UIViewController {
    
    // MARK: - UI components
    
    let guideLabel = UILabel().then{
        $0.font = Font.signUpSmallGuideLabel
        let attrString = NSMutableAttributedString(string: "회원가입을 위한 \n정보를 입력해주세요")
    }
    
    let emailGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "이메일"
    }
    
    let emailTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "이메일 주소"
        $0.keyboardType = .emailAddress
    }
    
    let emailUnderBarView = UIView().then{
        $0.backgroundColor = .brownGreyColor
    }
    
    let emailErrorGuiedLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.alpha = 0
        $0.text = "올바른 이메일을 입력해주세요."
        $0.textColor = .pinkishColor
    }
    
    let emailCertificationButton = UIButton().then{
        $0.backgroundColor = .battleshipGrey
        $0.makeRounded(cornerRadius: 8)
        $0.setTitle("인증", for: .normal)
        $0.titleLabel?.font = Font.buttonLabel
        $0.tintColor = .white
    }
    
    let certificationGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "인증번호"
    }
    
    let certificationTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "인증번호 6자리를 입력해주세요"
    }
    
    let certificationUnderBarView = UIView().then{
        $0.backgroundColor = .brownGreyColor
    }
    
    let certificationErrorGuideLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.text = "인증번호가 다릅니다."
        $0.textColor = .pinkishColor
        $0.alpha = 0
    }
    
    let certificationButton = UIButton().then{
        $0.backgroundColor = .veryLightPink
        $0.makeRounded(cornerRadius: 8)
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = Font.buttonLabel
    }
    
    let firstPageControllView = UIView().then{
        $0.backgroundColor = .signatureColor
        $0.setRounded(radius: 3)
    }
    
    let secondPageControllView = UIView().then{
        $0.backgroundColor = UIColor.init(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        $0.setRounded(radius: 3)
    }
    
    let thirdPageControllView = UIView().then{
        $0.backgroundColor = UIColor.init(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        $0.setRounded(radius: 3)
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
        
        constraint()
        setLabel()
        setTextField()
        setNav()
        addKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initAnimate()
    }
    
    
    
    func setTextField(){
        emailTextField.delegate = self
        certificationTextField.delegate = self
        emailTextField.addTarget(self,
                                 action: #selector(EmailVC.textFieldDidChange(_:)),
                                 for: .editingChanged)
        certificationTextField.addTarget(self,
                                         action: #selector(EmailVC.textFieldDidChange(_:)),
                                         for: .editingChanged)
        
    }
    
}

extension EmailVC {
    
    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func tapNextButton() {
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "IDVC") as? IDVC
        
        vc?.email = email ?? ""
        
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    func setLabel(){
        let attrString = NSMutableAttributedString(string: "회원가입을 위한 \n정보를 입력해주세요")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
    
    
    
}

extension EmailVC : UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if emailTextField.text?.validateEmail() == true {
            emailUnderBarView.backgroundColor = .signatureColor
            emailErrorGuiedLabel.alpha = 0
        } else if emailTextField.text != "" {
            emailUnderBarView.backgroundColor = .pinkishColor
            emailErrorGuiedLabel.alpha = 1
        } else {
            emailUnderBarView.backgroundColor = .brownGreyColor
        }
    }
}

extension EmailVC {
    func emailTextDidChange(){
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.emailUnderBarView.backgroundColor = .signatureColor
        }, completion: nil)
    }
}

extension EmailVC {
    func initAnimate() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.firstPageControllView.bounds = .init(x: 0, y: 0, width: 4, height: 17)
                        self.firstPageControllView.backgroundColor = .signatureColor
                        
                        self.secondPageControllView.bounds = .init(x: -14, y: 0, width: 31, height: 17)
                        self.secondPageControllView.backgroundColor = UIColor.init(red: 216/255,
                                                                                   green: 216/255,
                                                                                   blue: 216/255,
                                                                                   alpha: 1)
                        
                        
                        self.thirdPageControllView.bounds = .init(x: -14, y: 0, width: 31, height: 17)
                        self.thirdPageControllView.backgroundColor = UIColor.init(red: 216/255,
                                                                                  green: 216/255,
                                                                                  blue: 216/255,
                                                                                  alpha: 1)
        }, completion: nil)
    }
    
    func isEditing(_ keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.guideLabel.alpha = 0
                        self.emailTextField.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.emailGuideLabel.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.emailUnderBarView.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.emailErrorGuiedLabel.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.emailCertificationButton.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.certificationTextField.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.certificationButton.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.certificationGuideLabel.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.certificationUnderBarView.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.certificationErrorGuideLabel.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        self.certificationTextField.transform = CGAffineTransform.init(translationX: 0, y: -90)
                        
                        
                        self.nextButton.transform = CGAffineTransform.init(translationX: 0, y: -keyboardHeight)
                        self.firstPageControllView.transform = CGAffineTransform.init(translationX: 0, y: -keyboardHeight)
                        self.secondPageControllView.transform = CGAffineTransform.init(translationX: 0, y: -keyboardHeight)
                        self.thirdPageControllView.transform = CGAffineTransform.init(translationX: 0, y: -keyboardHeight)
        }, completion: nil)
    }

    func endEditing() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.guideLabel.alpha = 1
                        self.emailTextField.transform = .identity
                        self.emailGuideLabel.transform = .identity
                        self.emailUnderBarView.transform = .identity
                        self.emailErrorGuiedLabel.transform = .identity
                        self.emailCertificationButton.transform = .identity
                        self.certificationTextField.transform = .identity
                        self.certificationButton.transform = .identity
                        self.certificationGuideLabel.transform = .identity
                        self.certificationUnderBarView.transform = .identity
                        self.certificationErrorGuideLabel.transform = .identity
                        self.certificationTextField.transform = .identity

                        self.nextButton.transform = .identity
                        self.firstPageControllView.transform = .identity
                        self.secondPageControllView.transform = .identity
                        self.thirdPageControllView.transform = .identity
        }, completion: nil)
    }

}

extension EmailVC {
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
