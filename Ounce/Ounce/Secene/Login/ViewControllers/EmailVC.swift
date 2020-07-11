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
    }
    
    let emailGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "이메일"
        $0.textColor = .dark
    }
    
    let emailTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "이메일 주소"
        $0.keyboardType = .emailAddress
        $0.tintColor = .black
        $0.clearButtonMode = .always
    }
    
    let emailUnderBarView = UIView().then{
        $0.backgroundColor = .pale
    }
    
    let emailErrorGuiedLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.alpha = 0
        $0.text = "올바른 이메일을 입력해주세요."
        $0.textColor = .darkPeach
    }
    
    let emailCertificationButton = UIButton().then{
        $0.backgroundColor = .darkPeach
        $0.makeRounded(cornerRadius: 8)
        $0.setTitle("인증", for: .normal)
        $0.titleLabel?.font = Font.buttonLabel
        $0.tintColor = .white
        $0.addTarget(self,
                     action: #selector(tapEmailCertificationButton),
                     for: .touchUpInside)
    }
    
    let certificationGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "인증번호"
        $0.textColor = .dark
    }
    
    let certificationTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "인증번호 6자리를 입력해주세요"
        $0.tintColor = .black
        $0.clearButtonMode = .always
    }
    
    let certificationUnderBarView = UIView().then{
        $0.backgroundColor = .pale
    }
    
    let certificationErrorGuideLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.text = "인증번호가 다릅니다."
        $0.textColor = .darkPeach
        $0.alpha = 0
    }
    
    let certificationButton = UIButton().then{
        $0.backgroundColor = .pale
        $0.makeRounded(cornerRadius: 8)
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = Font.buttonLabel
        $0.setTitleColor(.putty, for: .normal)
        $0.addTarget(self, action: #selector(tapCertificationButton), for: .touchUpInside)
    }
        
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "다음",
                                     style: .plain,
                                     target: self,
                                     action: #selector(tapNextButton))
        return button
        
    }()
    
    // MARK: - Variables and Properties
    
    var email: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        setLabel()
        setTextField()
        setButton()
        setNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
        
}

extension EmailVC {
    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = rightButton
//        rightButton.isEnabled = false
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

    @objc func tapNextButton() {
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "IDVC") as? IDVC
        
        vc?.email = email ?? ""
        
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    @objc func tapEmailCertificationButton(){
        print(#function)
    }
    
    @objc func tapCertificationButton(){
        print(#function)
    }
    
    func setLabel(){
        let attrString = NSMutableAttributedString(string: "회원가입을 위한 \n이메일을 입력해주세요")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
    
    func setButton() {
//        emailCertificationButton.isEnabled = false
//        certificationButton.isEnabled = false
    }
    
}

extension EmailVC : UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if emailTextField.text?.validateEmail() == true {
            emailUnderBarView.backgroundColor = .signatureColor
            emailErrorGuiedLabel.alpha = 0
            emailCertificationButton.isEnabled = true
            emailCertificationButton.backgroundColor = .signatureColor
        } else if emailTextField.text != "" {
            emailUnderBarView.backgroundColor = .pinkishColor
            emailCertificationButton.backgroundColor = .veryLightPink
            emailCertificationButton.isEnabled = false
            emailErrorGuiedLabel.alpha = 1
        } else {
            emailCertificationButton.backgroundColor = .veryLightPink
            emailCertificationButton.isEnabled = false
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

        }, completion: nil)
    }
}
