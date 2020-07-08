//
//  SignUpCompleteVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SignUpCompleteVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - Variables and Properties
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        setButton()
    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension SignUpCompleteVC {
    func setLabel() {
        let attrString = NSMutableAttributedString(string: "회원가입이 \n완료되었습니다.")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
    
    func setButton(){
        completeButton.addTarget(self,
                                 action: #selector(didTapCompleteButton),
                                 for: .touchUpInside)
        completeButton.backgroundColor = .wheatColor
        completeButton.setRounded(radius: 8)
        completeButton.titleLabel?.font = Font.guideLabel
        completeButton.tintColor = .black
    }
    
    @objc func didTapCompleteButton(){
        let vc = UIStoryboard.init(name: "Register",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "RegisterNavVC") as? RegisterNavVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.present(vc!, animated: true, completion: nil)
    }
}
