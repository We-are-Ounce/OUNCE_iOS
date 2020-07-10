//
//  RegisterDetailVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import CHIPageControl

class RegisterDetailVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var neutralizationRoundButton: UIButton!
    @IBOutlet weak var sexGuideLabel: UILabel!
    @IBOutlet weak var neutralizationButton: UIButton!
    @IBOutlet weak var ageGuideLabel: UILabel!
    @IBOutlet weak var ageCountLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageUnderBarView: UIView!
    @IBOutlet weak var weightGuideLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightUnderBarView: UIView!
    @IBOutlet weak var weightCountLabel: UILabel!
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var bottomYLayoutConstraint: NSLayoutConstraint!
    
    let pageControl = CHIPageControlAji().then {
        $0.numberOfPages = 2
        $0.radius = 5
        $0.currentPageTintColor = .battleshipGrey
        $0.tintColor = .brownGreyColor
    }
    
    // MARK: - Variables and Properties
    
    var sex: Int = 4
    var isNeutralization : Bool = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        setGuideLabel()
        setButton()
        setTextField()
        constraints()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let image = UIImage(named: "smallLogo")
        navigationItem.titleView = UIImageView(image: image)
        addKeyboardNotification()
            }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        pageControl.set(progress: 1, animated: true)
        viewAnimate()
    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension RegisterDetailVC {
    @objc func didTapNextButton(){
//        let sb = UIStoryboard(name: "TabBar", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "TBC") as! TBC
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
        
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
          let registerVC = RegisterVC()
          registerVC.modalPresentationStyle = .fullScreen
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          appDelegate.window?.rootViewController?.present(registerVC, animated: true, completion: nil)
        })

    }
    
    func setGuideLabel() {
        let attrString = NSMutableAttributedString(string: "고양이의 정보를\n입력해주세요.")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 7))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
    
    func setButton() {
        maleButton.setRounded(radius: 8)
        maleButton.borderColor = .battleshipGrey
        maleButton.setTitleColor(.battleshipGrey, for: .normal)
        maleButton.borderWidth = 1.5
        maleButton.addTarget(self, action: #selector(didTapMaleButton), for: .touchUpInside)
        femaleButton.setRounded(radius: 8)
        femaleButton.borderColor = .battleshipGrey
        femaleButton.setTitleColor(.battleshipGrey, for: .normal)
        femaleButton.borderWidth = 1.5
        femaleButton.addTarget(self, action: #selector(didTapFemaleButton), for: .touchUpInside)
        neutralizationRoundButton.setRounded(radius: nil)
        neutralizationRoundButton.borderWidth = 0.1
        neutralizationRoundButton.addTarget(self, action: #selector(didTapNeutralizationButton), for: .touchUpInside)
        neutralizationRoundButton.borderColor = .battleshipGrey
        neutralizationRoundButton.setImage(UIImage(), for: .normal)
        neutralizationButton.setTitleColor(.battleshipGrey, for: .normal)
        neutralizationButton.addTarget(self, action: #selector(didTapNeutralizationButton), for: .touchUpInside)
        
    }
    
    func setTextField() {
        ageTextField.keyboardType = .numberPad
        weightTextField.keyboardType = .decimalPad
    }
    
    @objc func didTapMaleButton(){
        if (sex != 0) {
            sex = 0
            maleButton.backgroundColor = .battleshipGrey
            maleButton.setTitleColor(.white, for: .normal)
            femaleButton.backgroundColor = .white
            femaleButton.setTitleColor(.battleshipGrey, for: .normal)
        } else {
            sex = 2
            maleButton.backgroundColor = .white
            maleButton.setTitleColor(.battleshipGrey, for: .normal)
        }
    }
    
    @objc func didTapFemaleButton(){
        if (sex != 1) {
            sex = 1
            femaleButton.backgroundColor = .battleshipGrey
            femaleButton.setTitleColor(.white, for: .normal)
            maleButton.backgroundColor = .white
            maleButton.setTitleColor(.battleshipGrey, for: .normal)
        } else {
            sex = 2
            femaleButton.backgroundColor = .white
            femaleButton.setTitleColor(.battleshipGrey, for: .normal)
            
        }
        
    }
    
    @objc func didTapNeutralizationButton(){
        if !isNeutralization {
            isNeutralization = true
            neutralizationRoundButton.setImage(UIImage(named: "1735"), for: .normal)
            neutralizationRoundButton.borderColor = .white
        } else {
            isNeutralization = false
            neutralizationRoundButton.setImage(UIImage(), for: .normal)
            neutralizationRoundButton.borderColor = .battleshipGrey
        }
    }
}

extension RegisterDetailVC {
    func constraints(){
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.centerX.equalToSuperview()
            make.width.equalTo(17)
            make.height.equalTo(7)
        }
        
    }
    func viewAnimate(){
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.85,
                       initialSpringVelocity: 1,
                       options: [.curveEaseIn],
                       animations: {
                        // self를 항상 붙여줘야함 (클로저 안에서)
                        self.ageCountLabel.alpha = 1
                        self.ageCountLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.ageTextField.alpha = 1
                        self.ageTextField.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.ageUnderBarView.alpha = 1
                        self.ageUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.weightGuideLabel.alpha = 1
                        self.weightGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.weightTextField.alpha = 1
                        self.weightTextField.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.weightUnderBarView.alpha = 1
                        self.weightUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.weightCountLabel.alpha = 1
                        self.weightCountLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.guideLabel.alpha = 1
                        self.guideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.maleButton.alpha = 1
                        self.maleButton.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.femaleButton.alpha = 1
                        self.femaleButton.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.neutralizationRoundButton.alpha = 1
                        self.neutralizationRoundButton.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.sexGuideLabel.alpha = 1
                        self.sexGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.neutralizationButton.alpha = 1
                        self.neutralizationButton.transform = CGAffineTransform.init(translationX: -100, y: 0)
                        self.ageGuideLabel.alpha = 1
                        self.ageGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: 0)
        })
    }
    func isEditing() {
        UIView.animate(withDuration: 0.5, delay: 0,options: [.curveEaseIn], animations: {
            self.guideLabel.alpha = 0
            self.sexGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.maleButton.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.femaleButton.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.neutralizationRoundButton.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.neutralizationButton.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.ageGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.ageTextField.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.ageUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.ageCountLabel.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.weightGuideLabel.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.weightTextField.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.weightUnderBarView.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.weightCountLabel.transform = CGAffineTransform.init(translationX: -100, y: -100)
        })
    }
    
    func endEditing() {
        UIView.animate(withDuration: 0.5, delay: 0,options: [.curveEaseIn], animations: {
            self.guideLabel.alpha = 1
            self.sexGuideLabel.transform = .identity
            self.maleButton.transform = .identity
            self.femaleButton.transform = .identity
            self.neutralizationRoundButton.transform = .identity
            self.neutralizationButton.transform = .identity
            self.ageGuideLabel.transform = .identity
            self.ageTextField.transform = .identity
            self.ageUnderBarView.transform = .identity
            self.ageCountLabel.transform = .identity
            self.weightGuideLabel.transform = .identity
            self.weightTextField.transform = .identity
            self.weightUnderBarView.transform = .identity
            self.weightCountLabel.transform = .identity
            
        })
    }
    
}

extension RegisterDetailVC : UITextFieldDelegate { }

extension RegisterDetailVC {
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification)  {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardHeight = keyboardFrame.height
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let bottomPadding = keyWindow?.safeAreaInsets.bottom
            
            bottomYLayoutConstraint.constant = (keyboardHeight - (bottomPadding ?? 0))
            isEditing()
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            
            bottomYLayoutConstraint.constant = 34
            endEditing()
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

