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

    let loginButton = UIButton().then {
        $0.backgroundColor = .signatureColor
        $0.setTitle("로그인", for: .normal)
        $0.makeRounded(cornerRadius: 8)
        $0.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
    }
        
    let findIDButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.brownGreyColor, for: .normal)
        $0.titleLabel?.font = Font.smallGuideLabel
        $0.addTarget(self, action: #selector(tapFindIDButton), for: .touchUpInside)
    }
    
    let leftGuideView = UIView().then {
        $0.backgroundColor = .brownGreyColor
    }
    
    let findPWButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.brownGreyColor, for: .normal)
        $0.titleLabel?.font = Font.smallGuideLabel
        $0.addTarget(self, action: #selector(tapFindPWButton), for: .touchUpInside)
    }
    
    let rightGuideView = UIView().then {
        $0.backgroundColor = .brownGreyColor
    }

    let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.brownGreyColor, for: .normal)
        $0.titleLabel?.font = Font.smallGuideLabel
        $0.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
    }
    
    // MARK: - Variables and Properties
    
    let name = NSMutableAttributedString(string: "회원가입")
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

extension LoginVC {
    
    @objc func tapSignInButton() {
        let vc = UIStoryboard.init(name: "TabBar",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "TBC") as? TBC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.present(vc!, animated: true, completion: nil)
    }

    @objc func tapFindIDButton() {
        let vc = UIStoryboard.init(name: "Login",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "EmailVC") as? EmailVC
        
        vc?.modalPresentationStyle = .fullScreen

        self.present(vc!, animated: false, completion: nil)
    }

    @objc func tapFindPWButton() {
        print(#function)
        
        let vc = UIStoryboard.init(name: "Login",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "EmailVC") as? EmailVC

        vc?.modalPresentationStyle = .fullScreen

        self.present(vc!, animated: false, completion: nil)
    }

    @objc func tapSignUpButton() {
        print(#function)
        
        let vc = UIStoryboard.init(name: "Login",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "EmailVC") as? EmailVC

        vc?.modalPresentationStyle = .fullScreen

        self.present(vc!, animated: false, completion: nil)
    }

}
