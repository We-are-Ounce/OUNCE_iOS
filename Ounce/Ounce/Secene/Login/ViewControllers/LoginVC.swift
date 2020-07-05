//
//  LoginVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/01.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then

class LoginVC: UIViewController {
    
    // MARK: - UI components
    
    let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "btnAdd")
    }
    
    let idGuideLabel = UILabel().then {
        $0.font = Font.guideLabel
        $0.text = "아이디"
        $0.textColor = .signatureColor
    }
    
    let idErrorGuideLabel = UILabel().then {
        $0.font = Font.smallGuideLabel
        $0.text = "아이디 혹은 비밀번호가 잘못되었습니다."
        $0.alpha = 0
        $0.textColor = .red
    }
    
    let idTextField = UITextField().then {
        $0.font = Font.textField
        $0.placeholder = "Ounce"
    }
    
    let idTextFieldGuideView = UIView().then {
        $0.backgroundColor = .brownGreyColor
    }
    
    let pwGuideLabel = UILabel().then {
        $0.font = Font.guideLabel
        $0.text = "비밀번호"
        $0.textColor = .signatureColor
    }
    
    let pwErrorGuideLabel = UILabel().then {
        $0.font = Font.smallGuideLabel
        $0.text = "아이디 혹은 비밀번호가 잘못되었습니다."
        $0.alpha = 0
        $0.textColor = .red
    }
    
    let pwTextField = UITextField().then {
        $0.font = Font.textField
        $0.placeholder = "OuncePW"
        $0.isSecureTextEntry = true
    }
    
    let pwTextFieldGuideView = UIView().then {
        $0.backgroundColor = .brownGreyColor
    }
    
    let findGuideButton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.brownGreyColor, for: .normal)
        $0.titleLabel?.font = Font.smallGuideLabel
        $0.addTarget(self, action: #selector(tapFindButton), for: .touchUpInside)
    }
    
    let loginButton = UIButton().then {
        $0.backgroundColor = .signatureColor
        $0.setTitle("로그인", for: .normal)
        $0.makeRounded(cornerRadius: 8)
        $0.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
    }
    
    let signUpGuideLabel = UILabel().then {
        $0.font = Font.smallGuideLabel
        $0.text = "ounce가 처음이신가요?"
    }
    
    let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.signatureColor, for: .normal)
        $0.titleLabel?.font = Font.smallButtonLabel
        $0.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
    }
    
    // MARK: - Variables and Properties
    
    let name = NSMutableAttributedString(string: "회원가입")
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        
        name.addAttribute(NSAttributedString.Key.underlineStyle,
                          value: NSUnderlineStyle.single.rawValue,
                          range: NSMakeRange(0, 4))
        signUpButton.setAttributedTitle(name, for: .normal)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func tapFindButton() {
        print(#function)
    }
    
    
    @objc func tapSignUpButton() {
        print(#function)
    }
}

extension LoginVC {
    @objc func tapSignInButton() {
        
        let sb = UIStoryboard(name: "TabBar", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TBC") as! TBC
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
}
