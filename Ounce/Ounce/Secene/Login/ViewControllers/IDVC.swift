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
        $0.alpha = 1
    }
    
    let idGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "아이디"
        $0.alpha = 1
    }
    
    let idTextField = UITextField().then{
        $0.font = Font.dateLabel
        $0.placeholder = "5자리 이상 입력해주세요."
        $0.alpha = 1
        $0.clearButtonMode = .always
        $0.returnKeyType = .next
        $0.tintColor = .black
    }
    
    let idUnderBarView = UIView().then {
        $0.backgroundColor = .pale
        $0.alpha = 1
    }
    
    let idErrorGuiedLabel = UILabel().then{
        $0.font = Font.errorLabel
        $0.alpha = 0
        $0.textColor = .darkPeach
        $0.text = "5자리 이상 입력해주세요."
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
        
        setLabel()
        constraint()
        setNav()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewAnimate()
    }
    
}

extension IDVC {
    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setTextField(){
        idTextField.delegate = self
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    func setLabel(){
        let attrString = NSMutableAttributedString(string: "회원가입을 위한 \n아이디를 입력해주세요")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
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

extension IDVC: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if idTextField.text?.count ?? 0 > 5 {
            idUnderBarView.backgroundColor = .pale
            idErrorGuiedLabel.alpha = 0
        } else {
            idUnderBarView.backgroundColor = .darkPeach
            idErrorGuiedLabel.alpha = 1
        }
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
}
