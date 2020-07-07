//
//  EmailVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

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
    
    // MARK: - Variables and Properties
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        setLabel()
        setTextField()
        setNav()
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
        print(#function)
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "IDVC") as? IDVC
        
        vc?.modalPresentationStyle = .fullScreen
        
                self.navigationController?.pushViewController(vc!, animated: true)
//        self.present(vc!, animated: false)
        
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
    
}

extension EmailVC {
    func initAnimate() {
        UIView.animate(withDuration: 0.3,
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
}
