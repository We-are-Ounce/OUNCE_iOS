//
//  PostVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class PostVC: UIViewController {
    
    //    @IBAction func out(_ sender: Any) {
    //        self.dismiss(animated: true, completion: nil)
    //    }
    
    @IBOutlet weak var addScrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    // 리뷰 작성시
    var foodIdx: Int?
    var foodImg: String?
    var foodManu: String?
    var foodName: String?
    var foodDry: String?
    var foodMeat1: String?
    var foodMeat2: String?
    
    // 리뷰를 볼 때
    var reviewIdx: Int?
    
    // 컬렉션뷰에서 받아오는 값
    var imageNameVC: String?
    var companyNameVC: String?
    var productNameVC: String?
    // server post info
    var rating: Int?
    var prefer: Int?
    var review: String? // 한 줄 리뷰
    var memo: String? // 메모
    var pooStatus: Int?
    var pooSmell: Int?
    var reviewEye: Int?
    var reviewEar: Int?
    var reviewHair: Int?
    var reviewVomit: Int?
    
    //    var foodMeat1: String?
    //    var foodMeat2: String?
    //    var foodDry: String?
    
    // var date: String?
    var foodIndexNumber: Int?
    var profileIndexNumber: Int?
    var reviewIndexNumber: Int?
    var postDelegate: PostDelegate?
    var reviews: Review?
    
    var isEdit: Bool = false
    var isOther: Bool = false
    
    let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
    
    
    lazy var doneButton = UIBarButtonItem(title: "완료",
                                          style: .plain,
                                          target: self,
                                          action: #selector(saveButtonDidTap))
    
    lazy var moreButton = UIBarButtonItem(image: UIImage(named: "icMore"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(moreButtonDidTap))
    
    lazy var editButton = UIBarButtonItem(title: "수정",
                                          style: .plain,
                                          target: self,
                                          action: #selector(editButtonDidTap))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "기록하기"
        custom.foodDry.setTitle(foodDry, for: .normal)
        custom.foodMeat1.setTitle(foodMeat1, for: .normal)
        
        if (foodMeat2) == ""{
            custom.foodMeat2.alpha = 0
            custom.foodMeat2.borderWidth = 0
            custom.stackViewLeadingConstraint.constant += 40.5
        } else {
            custom.foodMeat2.setTitle(foodMeat2, for: .normal)
            custom.foodMeat2.borderWidth = 1
        }
        
        custom.profileIndex = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        custom.companyName.text = companyNameVC
        custom.productName.text = productNameVC
        custom.productImg.imageFromUrl(imageNameVC, defaultImgPath: "")
        self.addScrollView.addSubview(custom)
        custom.viewDidLoad()
        //custom.viewDidAppear()
        custom.rootVC = self
        rating = custom.sendRating
        prefer = custom.sendPrefer
        //review = custom.sendReview
        //memo = custom.sendMemo
        pooStatus = custom.sendPooState
        pooSmell = custom.sendPooSmell
        reviewEye = custom.sendEye
        reviewEar = custom.sendEar
        reviewHair = custom.sendFur
        reviewVomit = custom.sendVomit
        //foodIndexNumber = custom.sendFoodIndex
        custom.foodIndex = foodIndexNumber ?? 0
        //custom.profileIndex = profileIndexNumber ?? 0
        //profileIndexNumber = custom.sendProfileIndex
        if isOther || isEdit {
            custom.scoreBtn1.isEnabled = false
            custom.scoreBtn2.isEnabled = false
            custom.scoreBtn3.isEnabled = false
            custom.scoreBtn4.isEnabled = false
            custom.scoreBtn5.isEnabled = false
            
            custom.likeBtn1.isEnabled = false
            custom.likeBtn2.isEnabled = false
            custom.likeBtn3.isEnabled = false
            custom.likeBtn4.isEnabled = false
            custom.likeBtn5.isEnabled = false
            
            custom.pooState1.isEnabled = false
            custom.pooState2.isEnabled = false
            custom.pooState3.isEnabled = false
            custom.pooState4.isEnabled = false
            custom.pooState5.isEnabled = false
            
            custom.pooSmell1.isEnabled = false
            custom.pooSmell2.isEnabled = false
            custom.pooSmell3.isEnabled = false
            custom.pooSmell4.isEnabled = false
            custom.pooSmell5.isEnabled = false
            
            custom.eyeTrouble.isEnabled = false
            custom.earTrouble.isEnabled = false
            custom.furTrouble.isEnabled = false
            custom.vomitTrouble.isEnabled = false
            
            custom.criticTextField.isEnabled = false
            custom.memoTextView.isEditable = false
        }
        
        if !isEdit {
            self.navigationItem.rightBarButtonItem = doneButton
        } else if isOther{
            reviewDetailService(reviewIdx ?? 0)
        } else {
            self.navigationItem.rightBarButtonItem = moreButton
            reviewDetailService(reviewIdx ?? 0)
        }
        
        
        custom.criticTextField.delegate = self
        custom.criticTextField.tintColor = .black
        custom.memoTextView.delegate = self
        custom.memoTextView.tintColor = .black
        addScrollView.delegate = self
        addKeyboardNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    @objc func rightButtonDidTap(){
        print(#function)
    }
    
    @objc func moreButtonDidTap(){
        print(#function)
        let settingAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "수정", style: .default) { (_) in
            self.custom.scoreBtn1.isEnabled = true
            self.custom.scoreBtn2.isEnabled = true
            self.custom.scoreBtn3.isEnabled = true
            self.custom.scoreBtn4.isEnabled = true
            self.custom.scoreBtn5.isEnabled = true
            
            self.custom.likeBtn1.isEnabled = true
            self.custom.likeBtn2.isEnabled = true
            self.custom.likeBtn3.isEnabled = true
            self.custom.likeBtn4.isEnabled = true
            self.custom.likeBtn5.isEnabled = true
            
            self.custom.pooState1.isEnabled = true
            self.custom.pooState2.isEnabled = true
            self.custom.pooState3.isEnabled = true
            self.custom.pooState4.isEnabled = true
            self.custom.pooState5.isEnabled = true
            
            self.custom.pooSmell1.isEnabled = true
            self.custom.pooSmell2.isEnabled = true
            self.custom.pooSmell3.isEnabled = true
            self.custom.pooSmell4.isEnabled = true
            self.custom.pooSmell5.isEnabled = true
            
            self.custom.eyeTrouble.isEnabled = true
            self.custom.earTrouble.isEnabled = true
            self.custom.furTrouble.isEnabled = true
            self.custom.vomitTrouble.isEnabled = true
            
            self.custom.criticTextField.isEnabled = true
            self.custom.memoTextView.isEditable = true
            
            self.navigationItem.rightBarButtonItem = self.editButton
        }
        let secondAction = UIAlertAction(title: "삭제", style: .destructive) { (_) in
            print("수정 반드시할꼬에요 여기에다가 삭제하는 api 연결해주면 된다~~")
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        settingAlert.addAction(firstAction)
        settingAlert.addAction(secondAction)
        settingAlert.addAction(cancelAction)
        settingAlert.view.tintColor = UIColor.black
        
        present(settingAlert,animated: true,completion: nil)
        
    }
    
    @objc func editButtonDidTap(){
        print(#function)
        
        
        updateReview(custom.reviewIdx,
                     custom.rating,
                     custom.prefer,
                     custom.review,
                     custom.memo,
                     custom.pooState,
                     custom.pooSmell,
                     custom.eye,
                     custom.ear,
                     custom.fur,
                     custom.vomit)
        
        
        
    }
    
    @objc func saveButtonDidTap(){
        // 리뷰 작성 버튼 - 완료 버튼 눌렀을 때 액션
        custom.review = custom.criticTextField.text!
        custom.memo = custom.memoTextView.text
        
        //custom.foodIndex = custom.sendFoodIndex ?? 0
        print(custom.foodIndex)
        ReviewService.shared.Review(custom.rating,
                                    custom.prefer,
                                    custom.review,
                                    custom.memo,
                                    custom.pooState,
                                    custom.pooSmell,
                                    custom.eye,
                                    custom.ear,
                                    custom.fur,
                                    custom.vomit,
                                    custom.foodIndex,
                                    custom.profileIndex){ NetworkResult
                                        in switch NetworkResult{
                                        case .success(_):
                                            print("버튼작동")
                                            self.dismiss(animated: true, completion: nil)
                                        case .requestErr(let message):
                                            guard let message = message as? Int else {return}
                                            print(message)
                                            print("requestErr")
                                            
                                        case .serverErr:
                                            print("serverErr")
                                        case .networkFail:
                                            print("networkFail")
                                            
                                        case .pathErr:
                                            print("pathErr")
                                        }
                                        
                                        
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
}

extension PostVC {
    
    
    //func
    func reviewDetailService(_ reviewIndex: Int){
        ReviewUpdateService.shared.reviewDetail(reviewIndex){ responsedata in
            switch responsedata {
           
            case .success(let response):
                let resp = response as! [DetailReview]
                let res = resp[0]
                self.custom.reviewIdx = reviewIndex
                self.custom.foodIndex = res.foodIdx
                self.custom.foodDry.setTitle(res.foodDry, for: .normal)
                self.custom.foodMeat1.setTitle(res.foodMeat1, for: .normal)
                if (res.foodMeat2) == "" {
                    self.custom.foodMeat2.alpha = 0
                    self.custom.foodMeat2.borderWidth = 0
                    self.custom.stackViewLeadingConstraint.constant += 40.5
                } else {
                    self.custom.foodMeat2.setTitle(res.foodMeat2, for: .normal)
                    self.custom.foodMeat2.borderWidth = 1
                }
                
                self.custom.profileIndex = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
                self.custom.companyName.text = res.foodManu
                self.custom.productName.text = res.foodName
                
                self.custom.productImg.imageFromUrl(res.foodImg, defaultImgPath: "")
                
                switch Int(res.reviewPrefer) {
                case 1:
                    self.custom.likeBtn1selected(self)
                case 2:
                    self.custom.likeBtn2selected(self)
                case 3:
                    self.custom.likeBtn3selected(self)
                case 4:
                    self.custom.likeBtn4selected(self)
                case 5:
                    self.custom.likeBtn5selected(self)
                case .none:
                    print(11)
                case .some(_):
                    print(22)
                }
                
                switch Int(res.reviewRating){
                case 1:
                    self.custom.scoreBtn1selected(self)
                case 2:
                    self.custom.scoreBtn2selected(self)
                case 3:
                    self.custom.scoreBtn3selected(self)
                    
                case 4:
                    self.custom.scoreBtn4selected(self)
                case 5:
                    self.custom.scoreBtn5selected(self)
                    
                case .none:
                    print(11)
                case .some(_):
                    print(22)
                }
                
                switch (res.reviewSmell){
                case 1:
                    self.custom.pooSmell1selected(self)
                case 2:
                    self.custom.pooSmell2selected(self)
                case 3:
                    self.custom.pooSmell3selected(self)
                case 4:
                    self.custom.pooSmell4selected(self)
                case 5:
                    self.custom.pooSmell5selected(self)
                default:
                    print(11)
                }
                
                switch (res.reviewStatus){
                case 1:
                    self.custom.pooState1selected(self)
                case 2:
                    self.custom.pooState2selected(self)
                case 3:
                    self.custom.pooState3selected(self)
                case 4:
                    self.custom.pooState4selected(self)
                case 5:
                    self.custom.pooState5selected(self)
                default:
                    print(11)
                }
                
                if res.reviewEye == 1 {
                    
                    self.custom.eyeTroubleselected(self)
                    
                }
                
                if res.reviewEar == 1 {
                    
                    self.custom.earTroubleselected(self)
                }
                if res.reviewHair == 1 {
                    
                    self.custom.furTroubleselected(self)
                }
                if res.reviewVomit == 1 {
                    
                    self.custom.vomitTroubleselected(self)
                }
                
                self.custom.criticTextField.text = res.reviewInfo
                self.custom.memoTextView.text = res.reviewMemo
                
            case .requestErr(_) :
                print("requset error")
                
            case.pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print("failure")
                
            }
        }
    }
}

extension PostVC {
    
    func updateReview(_ reviewIdx: Int,
                      _ reviewRating: Int,
                      _ reviewPrefer: Int,
                      _ reviewInfo:String,
                      _ reviewMemo: String,
                      _ reviewStatus: Int,
                      _ reviewSmell: Int,
                      _ reviewEye: Int,
                      _ reviewEar: Int,
                      _ reviewHair: Int,
                      _ reviewVomit: Int){
        ReviewUpdateService.shared.updateReview(reviewIdx,reviewRating, reviewPrefer, reviewInfo, reviewMemo, reviewStatus, reviewSmell, reviewEye, reviewEar, reviewHair, reviewVomit){ responsedata in
              switch responsedata {
              case .success(let data):
                let resp = data as! [AddReview]
                print("변경정보",resp)
                //print("")
                  self.dismiss(animated: true, completion: nil)
                  
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
            
            var contentInset:UIEdgeInsets = self.addScrollView.contentInset
            contentInset.bottom = keyboardHeight - (bottomPadding ?? 0)
            
            addScrollView.contentInset = contentInset
            addScrollView.scrollToBottom()
            
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
            let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardHeight = keyboardFrame.height
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let bottomPadding = keyWindow?.safeAreaInsets.bottom
            
            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            addScrollView.contentInset = contentInset
            
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

extension PostVC: UIScrollViewDelegate {
    
    
}

extension PostVC: UITextViewDelegate{
    
}

extension PostVC: UITextFieldDelegate{
    
}

protocol PostDelegate {
    func moveInfo(_ reviewRating: Int,
                  _ reviewPrefer: Int,
                  _ reviewInfo: String,
                  _ reviewMemo: String,
                  _ reviewStatus: Int,
                  _ reviewSmell: Int,
                  _ reviewEye: Int,
                  _ reviewEar: Int,
                  _ reviewHair: Int,
                  _ reviewVomit: Int,
                  _ foodIdx: Int,
                  _ profileIdx: Int)
}
