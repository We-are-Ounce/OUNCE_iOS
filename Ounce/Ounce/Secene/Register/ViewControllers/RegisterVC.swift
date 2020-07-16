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
import SwiftKeychainWrapper

class RegisterVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var scrollView: UIScrollView!
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
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "완료",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapNextButton))
        //        button.isEnabled = false
        return button
        
    }()
    lazy var editButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "icSave"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapEditButton))

        return button
    }()
    lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "icClose"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapBackButton))
        return button
        
    }()

    // MARK: - Variables and Properties
    
    var selectedItems = [YPMediaItem]()
    var sex: Int = 4
    var isNeutralization : Bool = false
    var isEdit: Bool = false
    var profiles: [MyProfile]?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        print(isEdit)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setGuideLabel()
        setButton()
        setTextField()
        setProfileIMG()
        let image = UIImage(named: "smallLogo")
        navigationItem.titleView = UIImageView(image: image)
        addKeyboardNotification()
        setNav()
        findEdit()
    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension RegisterVC {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    func findEdit(){
        let profileIndex = KeychainWrapper.standard.integer(forKey: "currentProfile")
        navigationController?.isNavigationBarHidden = false
        if profileIndex != nil {
            navigationItem.rightBarButtonItem = editButton
            navigationItem.leftBarButtonItem = backButton
            profileService(profileIndex ?? 0)
        } else {
            navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    func setView(){
        dump(profiles)
        profileIMG.imageFromUrl(profiles?[0].profileImg, defaultImgPath: "")
        nameTextField.text = profiles?[0].profileName
        contentTextField.text = profiles?[0].profileInfo
//        maleButton
//        femaleButton
//        neutralizationRoundButton
//
//        neutralizationButton
//        ageTextField
//
//        weightTextField: UITextField!
//        @IBOutlet weak var weightCountLabel: UILabel!

    }
    
    func setNav(){
    }
    
    func setProfileIMG(){
        profileIMG.setRounded(radius: nil)
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
        print(ageTextField.text ?? "")
        enroll(profileIMG.image ?? UIImage(),
               nameTextField.text ?? "",
               weightTextField.text ?? "",
               (sex == 0) ? "male" : "female",
               isNeutralization ? "true" : "false",
               ageTextField.text ?? "",
               contentTextField.text ?? "")
    }
    @objc func didTapEditButton(){
        //print(#function)
        
    }

    
    @objc func didTapBackButton(){
        dismiss(animated: true, completion: nil)
    }

    
    func setButton() {
        maleButton.setRounded(radius: 8)
        //maleButton.borderColor = .battleshipGrey
        maleButton.borderColor = .pale
        maleButton.setTitleColor(.black, for: .normal)
        maleButton.borderWidth = 1.5
        maleButton.addTarget(self, action: #selector(didTapMaleButton), for: .touchUpInside)
        femaleButton.setRounded(radius: 8)
        femaleButton.borderColor = .pale
        femaleButton.setTitleColor(.black, for: .normal)
        femaleButton.borderWidth = 1.5
        femaleButton.addTarget(self, action: #selector(didTapFemaleButton), for: .touchUpInside)
        neutralizationRoundButton.setRounded(radius: nil)
        neutralizationRoundButton.borderWidth = 0.1
        neutralizationRoundButton.addTarget(self, action: #selector(didTapNeutralizationButton), for: .touchUpInside)
        neutralizationRoundButton.borderColor = .battleshipGrey
        neutralizationRoundButton.setImage(UIImage(), for: .normal)
        neutralizationButton.setTitleColor(.battleshipGrey, for: .normal)
        neutralizationButton.addTarget(self, action: #selector(didTapNeutralizationButton), for: .touchUpInside)
        profileSetButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
    }
    
    func setTextField() {
        ageTextField.tintColor = .black
        ageTextField.keyboardType = .numberPad
        weightTextField.keyboardType = .decimalPad
        weightTextField.tintColor = .black
        ageTextField.delegate = self
        ageTextField.addTarget(self,
                               action: #selector(textFieldDidChange),
                               for: .editingChanged)
        nameTextField.tintColor = .black
        nameTextField.delegate = self
        nameTextField.addTarget(self,
                                action: #selector(textFieldDidChange),
                                for: .editingChanged)
        weightTextField.delegate = self
        weightTextField.addTarget(self,
                                  action: #selector(textFieldDidChange),
                                  for: .editingChanged)
        contentTextField.tintColor = .black
        contentTextField.delegate = self
        contentTextField.addTarget(self,
                                   action: #selector(textFieldDidChange),
                                   for: .editingChanged)
    }
    
    @objc func didTapMaleButton(){
        if (sex != 0) {
            sex = 0
            //maleButton.backgroundColor = .battleshipGrey
            maleButton.borderColor = .black
            //maleButton.setTitleColor(.white, for: .normal)
            femaleButton.borderColor = .pale
            //femaleButton.backgroundColor = .white
            //femaleButton.setTitleColor(.battleshipGrey, for: .normal)
        } else {
            sex = 2
            maleButton.borderColor = .pale
           // maleButton.backgroundColor = .white
            //maleButton.setTitleColor(.battleshipGrey, for: .normal)
        }
    }
    
    @objc func didTapFemaleButton(){
        if (sex != 1) {
            sex = 1 //선택 되었을 때.
            femaleButton.borderColor = .black
            //femaleButton.backgroundColor = .battleshipGrey
            //femaleButton.setTitleColor(.white, for: .normal)
            maleButton.borderColor = .pale
            //maleButton.backgroundColor = .white
           // maleButton.setTitleColor(.battleshipGrey, for: .normal)
        } else {
            sex = 2
            femaleButton.borderColor = .pale
            //femaleButton.backgroundColor = .white
            //femaleButton.setTitleColor(.battleshipGrey, for: .normal)
            
        }
        
    }
    
    @objc func didTapNeutralizationButton(){
        if !isNeutralization {
            isNeutralization = true
            neutralizationRoundButton.setImage(UIImage(named: "btnSelected"), for: .normal)
            neutralizationRoundButton.borderColor = .white
        } else {
            isNeutralization = false
            neutralizationRoundButton.setImage(UIImage(), for: .normal)
            neutralizationRoundButton.borderColor = .battleshipGrey
        }
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField){
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.scrollRectToVisible(CGRect(x: 0,
                                              y: -(textField.frame.origin.y+100),
                                              width: 0, height: 0),
                                       animated: true)
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
            
            var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = (keyboardHeight - (bottomPadding ?? 0))
            scrollView.contentInset = contentInset
            
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
            
            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}


extension RegisterVC {
    func enroll(_ profileIMG: UIImage,
                _ profileName: String,
                _ profileWeight: String,
                _ profileGender: String,
                _ profileNeutral: String,
                _ profileAge: String,
                _ profileInfo: String){
        UserService.shared.enrollProfile(profileIMG,
                                         profileName,
                                         profileWeight,
                                         profileGender,
                                         profileNeutral,
                                         profileAge,
                                         profileInfo)
        {
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
            case .success(let res):
                let sb = UIStoryboard(name: "Login", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "SignUpCompleteVC") as! SignUpCompleteVC
                vc.modalPresentationStyle = .fullScreen
                vc.imageName = "cat"
                vc.stringName = "고양이 등록이\n 완료되었습니다."
                vc.stringIndex = 6
                vc.judgeBool = 1
                vc.completeString = "완료"
                
                let profile = res as! ProfileIndex
                KeychainWrapper.standard.set(profile.profileIdx, forKey: "currentProfile")
                self.present(vc, animated: true)
            case .requestErr:
                self.simpleAlert(title: "실패", message: "")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print(".networkFail")
                
            }
        }
    }
    
    func profileService(_ profileIndex: Int) {
        MyProfileService.shared.myprofile(String(profileIndex)) { responsedata in
            switch responsedata {
            case .success(let data):
                self.profiles = data as? [MyProfile]
                self.setView()

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

