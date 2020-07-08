//
//  PasswordVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

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
        $0.backgroundColor = .signatureColor
        $0.alpha = 0
    }
    
    let pwErrorGuiedLabel = UILabel().then{
        $0.font = Font.dateLabel
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
        $0.backgroundColor = .signatureColor
        $0.alpha = 0
    }

    let pwCertificationErrorGuiedLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.alpha = 0
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
        setNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initAnimate()
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
        print(#function)
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "SignUpCompleteVC") as? SignUpCompleteVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.present(vc!, animated: false)
    }
}

extension PasswordVC {
    func initAnimate() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        
                        self.firstPageControllView.bounds = .init(x: 0, y: 0, width: 4, height: 17)
                        self.firstPageControllView.backgroundColor = UIColor.init(red: 216/255,
                                                                                  green: 216/255,
                                                                                  blue: 216/255,
                                                                                  alpha: 1)
                        
                        self.secondPageControllView.bounds = .init(x: -14, y: 0, width: 31, height: 17)
                        self.secondPageControllView.backgroundColor = UIColor.init(red: 216/255,
                                                                                   green: 216/255,
                                                                                   blue: 216/255,
                                                                                   alpha: 1)
                        
                        
                        self.thirdPageControllView.bounds = .init(x: -14, y: 0, width: 31, height: 17)
                        self.thirdPageControllView.backgroundColor = .signatureColor
        }, completion: nil)
    }
    
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

}
