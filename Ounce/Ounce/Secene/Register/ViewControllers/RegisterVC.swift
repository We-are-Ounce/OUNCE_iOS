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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var bottomYLayoutConstraint: NSLayoutConstraint!
        
    let pageControl = CHIPageControlAji().then {
        $0.numberOfPages = 2
        $0.radius = 5
        $0.currentPageTintColor = .battleshipGrey
        $0.tintColor = .brownGreyColor
    }

    
    // MARK: - Variables and Properties
    
    var selectedItems = [YPMediaItem]()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        profileSetButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        setProfileIMG()
        setGuideLabel()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let image = UIImage(named: "smallLogo")
        navigationItem.titleView = UIImageView(image: image)
        constraints()
        addKeyboardNotification()
    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension RegisterVC {
    @objc func didTapNextButton(){
        let sb = UIStoryboard(name: "Register", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegisterDetailVC") as! RegisterDetailVC
        self.navigationController?.pushViewController(vc, animated: false)
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
    
}

extension RegisterVC {
    func constraints(){
        view.addSubview(pageControl)

        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.centerX.equalToSuperview()
        }
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

