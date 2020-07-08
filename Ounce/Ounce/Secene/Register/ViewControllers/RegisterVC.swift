//
//  RegisterVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import YPImagePicker

class RegisterVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var profileSetButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Variables and Properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        setProfileIMG()
        setGuideLabel()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension RegisterVC {
    @objc func didTapNextButton(){
        let sb = UIStoryboard(name: "Register", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegisterDetailVC") as! RegisterDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setProfileIMG(){
        profileIMG.backgroundColor = .yellow
        profileIMG.setRounded(radius: nil)
        profileSetButton.backgroundColor = .black
        profileSetButton.setRounded(radius: nil)
    }
    
    func setGuideLabel() {
        let attrString = NSMutableAttributedString(string: "고양이의 정보를\n입력해주세요.")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 7))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
}
