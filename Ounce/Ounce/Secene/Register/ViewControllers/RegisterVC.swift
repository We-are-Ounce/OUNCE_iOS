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

class RegisterVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var profileSetButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
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
