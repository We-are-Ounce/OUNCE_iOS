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
        $0.font = Font.dateLabel
    }
    
    let idGuideLabel = UILabel().then{
        $0.font = Font.dateLabel
        $0.text = "아이디"
    }
    
    let idTextField = UITextField().then{
        $0.font = Font.dateLabel
    }
    
    let idUnderBarView = UIView().then {
        $0.backgroundColor = .signatureColor
    }
    
    let idErrorGuiedLabel = UILabel().then{
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

extension IDVC {
    @objc func tapNextButton() {
        print(#function)
        let vc = UIStoryboard.init(name: "Login",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "IDVC") as? IDVC
        
        vc?.modalPresentationStyle = .fullScreen

        self.present(vc!, animated: false, completion: nil)

    }
}

