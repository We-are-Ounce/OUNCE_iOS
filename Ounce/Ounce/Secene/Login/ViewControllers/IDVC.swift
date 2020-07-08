//
//  IDVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

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
        
        setLabel()
        constraint()
        setNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

extension IDVC {
    func setNav(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc func tapNextButton() {
        print(#function)
        let vc = UIStoryboard.init(name: "Login",
                                   bundle: Bundle.main).instantiateViewController(
                                    withIdentifier: "PasswordVC") as? PasswordVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(vc!, animated: false)
    }
}

extension IDVC {
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
                        self.secondPageControllView.backgroundColor = .signatureColor
                        
                        self.thirdPageControllView.bounds = .init(x: -14, y: 0, width: 31, height: 17)
                        self.thirdPageControllView.backgroundColor = UIColor.init(red: 216/255,
                                                                                  green: 216/255,
                                                                                  blue: 216/255,
                                                                                  alpha: 1)
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
                        self.idGuideLabel.alpha = 1
                        self.idGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.idTextField.alpha = 1
                        self.idTextField.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.idUnderBarView.alpha = 1
                        self.idUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: 0)

                        
        })

    }
}
