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
        $0.font = Font.dateLabel
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
        $0.font = Font.dateLabel
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
    }
    
    func setLabel(){
        let attrString = NSMutableAttributedString(string: "회원가입을 위한 \n정보를 입력해주세요")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
}

extension EmailVC {
    @objc func tapNextButton() {
        print(#function)
    }
}
