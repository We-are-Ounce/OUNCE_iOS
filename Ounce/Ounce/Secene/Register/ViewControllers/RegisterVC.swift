//
//  RegisterVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import AVFoundation
import AVKit
import UIKit
import Photos

import YPImagePicker
import CHIPageControl

class RegisterVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameGuideLabel: UILabel!
    @IBOutlet weak var contentGuideLabel: UILabel!
    @IBOutlet weak var nameUnderBarView: UIView!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var contentUnderBarView: UIView!
    @IBOutlet weak var profileSetButton: UIButton!
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

    // MARK: - Variables and Properties
    
    var selectedItems = [YPMediaItem]()
    var sex: Int = 4
    var isNeutralization : Bool = false

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
//        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
//        profileSetButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
//        setProfileIMG()
//        setGuideLabel()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        constraints()
//        addKeyboardNotification()
        setGuideLabel()
        setButton()
        setTextField()
        constraints()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let image = UIImage(named: "smallLogo")
        navigationItem.titleView = UIImageView(image: image)
        addKeyboardNotification()

    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension RegisterVC {
    
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
    
    @objc func showPicker() {
        var config = YPImagePickerConfiguration()
        
        config.showsPhotoFilters = false
        config.shouldSaveNewPicturesToAlbum = true
        config.startOnScreen = .library
        config.wordings.libraryTitle = "갤러리"
        config.maxCameraZoomFactor = 2.0
        config.library.maxNumberOfItems = 1
        config.gallery.hidesRemoveButton = false
        config.hidesBottomBar = false
        config.hidesStatusBar = false
        config.overlayView = UIView()
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            self.selectedItems = items
            if let firstItem = items.first {
                switch firstItem {
                case .photo(let photo):
                    self.profileIMG.image = photo.image
                    picker.dismiss(animated: true, completion: nil)
                    
                default:
                    print("")
                }
            }
            
            picker.dismiss(animated: true)
        }
        present(picker, animated: true, completion: nil)
    }
    
    @objc func didTapNextButton(){
        let sb = UIStoryboard(name: "TabBar", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TBC") as! TBC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
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
        neutralizationRoundButton.addTarget(self, action: #selector(didTapNButton), for: .touchUpInside)
        neutralizationRoundButton.borderColor = .battleshipGrey
        neutralizationRoundButton.setImage(UIImage(), for: .normal)
        neutralizationButton.setTitleColor(.battleshipGrey, for: .normal)
        neutralizationButton.addTarget(self, action: #selector(didTapNButton), for: .touchUpInside)
        
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
    
    @objc func didTapNButton(){
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

extension RegisterVC {
    func constraints(){
//        view.addSubview(pageControl)

//        pageControl.snp.makeConstraints { (make) in
//            make.bottom.equalTo(nextButton.snp.top).offset(-17)
//            make.centerX.equalToSuperview()
//        }
    }
}

extension RegisterVC {
    func isEditing(){
        UIView.animate(withDuration: 0.5, delay: 0,options: [.curveEaseIn], animations: {
            self.guideLabel.alpha = 0
            self.profileIMG.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.nameTextField.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.nameGuideLabel.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.nameUnderBarView.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.contentTextField.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.contentGuideLabel.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.contentUnderBarView.transform = CGAffineTransform.init(translationX: 0, y: -84)
            self.profileSetButton.transform = CGAffineTransform.init(translationX: 0, y: -84)
        })
    }
    
    func endEditing(){
        UIView.animate(withDuration: 0.5, delay: 0,options: [.curveEaseIn], animations: {
            self.guideLabel.alpha = 0
            self.profileIMG.transform = .identity
            self.nameTextField.transform = .identity
            self.nameGuideLabel.transform = .identity
            self.nameUnderBarView.transform = .identity
            self.contentTextField.transform = .identity
            self.contentGuideLabel.transform = .identity
            self.contentUnderBarView.transform = .identity
            self.profileSetButton.transform = .identity
        })

    }
}

extension RegisterVC {
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
            
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

