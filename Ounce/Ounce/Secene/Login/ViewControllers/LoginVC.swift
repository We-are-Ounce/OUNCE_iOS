//
//  LoginVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/01.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then
import SwiftKeychainWrapper

class LoginVC: UIViewController {
    
    // MARK: - UI components
    
    let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "logoLogin")
    }
    
    let idGuideLabel = UILabel().then {
        $0.font = Font.guideLabel
        $0.text = "아이디"
        $0.textColor = .signatureColor
    }
    
    let idErrorGuideLabel = UILabel().then {
        $0.font = Font.errorLabel
        $0.text = "아이디 혹은 비밀번호가 잘못되었습니다."
        $0.alpha = 0
        $0.textColor = .pinkishTan
    }
    
    let idTextField = UITextField().then {
        $0.font = Font.textField
        $0.placeholder = "ID"
        $0.tintColor = .black
        $0.clearButtonMode = .always
    }
    
    let idTextFieldGuideView = UIView().then {
        $0.backgroundColor = .pale
    }
    
    let pwGuideLabel = UILabel().then {
        $0.font = Font.guideLabel
        $0.text = "비밀번호"
        $0.textColor = .signatureColor
    }
    
    let pwErrorGuideLabel = UILabel().then {
        $0.font = Font.errorLabel
        $0.text = "아이디 혹은 비밀번호가 잘못되었습니다."
        $0.alpha = 0
        $0.textColor = .pinkishTan
    }
    
    let pwTextField = UITextField().then {
        $0.font = Font.textField
        $0.placeholder = "Password"
        $0.isSecureTextEntry = true
        $0.tintColor = .black
        $0.clearButtonMode = .always
    }
    
    let pwTextFieldGuideView = UIView().then {
        $0.backgroundColor = .pale
    }
    
    let loginButton = UIButton().then {
        $0.backgroundColor = .pale
        $0.setTitleColor(.putty, for: .normal)
        $0.setTitle("로그인", for: .normal)
        $0.makeRounded(cornerRadius: 8)
        $0.titleLabel?.font = Font.guideLabel
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
        isAuto()
        constraint()
        setNav()
        setTextField()
//        idTextField.text = "yen"
//        pwTextField.text = "1234"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        KeychainWrapper.standard.removeAllKeys()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

extension LoginVC {
    
    func isAuto(){
        let id = KeychainWrapper.standard.string(forKey: "id") ?? ""
        let pw = KeychainWrapper.standard.string(forKey: "pw") ?? ""
        
        if (id == nil) || (id == "") { } else {
            signInService(id, pw)
        }
    }
    
    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
    }
    
    func setTextField(){
        idTextField.delegate = self
        pwTextField.delegate = self
        idTextField.addTarget(self,
                              action: #selector(LoginVC.textFieldDidChange(_:)),
                              for: .editingChanged)
        pwTextField.addTarget(self,
                              action: #selector(LoginVC.textFieldDidChange(_:)),
                              for: .editingChanged)
    }
    
    @objc func tapSignInButton() {
        signInService(idTextField.text ?? "", pwTextField.text ?? "")
        
    }
    
    @objc func tapFindIDButton() {
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "EmailVC") as? EmailVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func tapFindPWButton() {
        let vc = UIStoryboard.init(name: "Social",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "SocialVC") as? SocialVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func tapSignUpButton() {
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "EmailVC") as? EmailVC
        vc?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if idTextField.text != "" && pwTextField.text != "" {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .black
            loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .pale
            loginButton.setTitleColor(.putty, for: .normal)
        }
    }
}

extension LoginVC {
    func signInService(_ id: String, _ password: String) {
        UserService.shared.signIn(id, password) { responsedata in
            switch responsedata {
            case .success(let res):
                let response: SignIn = res as! SignIn
                let sb = UIStoryboard(name: "TabBar", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "TBC") as! TBC
                vc.modalPresentationStyle = .fullScreen
                print("token:",response.accessToken)
                print("profileIdx",response.profileIdx)
                KeychainWrapper.standard.set(self.idTextField.text ?? "",
                                             forKey: "id")
                KeychainWrapper.standard.set(self.pwTextField.text ?? "",
                                             forKey: "pw")

                KeychainWrapper.standard.set(response.accessToken,
                                             forKey: "Token")
                KeychainWrapper.standard.set(response.profileIdx,
                                             forKey: "currentProfile")
                KeychainWrapper.standard.set(response.profileCount,
                                             forKey: "currentProfileCount")
                
                self.present(vc, animated: true)
            case .requestErr(_):
                print("request error")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail :
                print("failure")
                
            }
        }
        
    }

}
