//
//  PostVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    //    @IBAction func out(_ sender: Any) {
    //        self.dismiss(animated: true, completion: nil)
    //    }
    
    @IBOutlet weak var addScrollView: UIScrollView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    let rightButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveButtonDidTap))

    var product: Product? //구조체
    var imageNameVC: UIImage?
    var companyNameVC: String?
    var productNameVC: String?
    // server post info
    var rating: Int?
    var prefer: Int?
    var review: String?
    var memo: String?
    var pooStatus: Int?
    var pooSmell: Int?
    var reviewEye: Int?
    var reviewEar: Int?
    var reviewHair: Int?
    var reviewVomit: Int?
    //var date: String?
    var foodIndexNumber: Int?
    var profileIndexNumber: Int?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        /*self.navigationItem.title = "기록하기"
        let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
        
        custom.companyName.text = companyNameVC
        custom.productName.text = productNameVC
        custom.productImg.image = imageNameVC
        self.addScrollView.addSubview(custom)
        custom.viewDidLoad()
        custom.rootVC = self
        
        rating = custom.rating
        prefer = custom.prefer
        review = custom.review
        memo = custom.memo
        pooStatus = custom.pooState
        pooSmell = custom.pooSmell
        reviewEye = custom.eye
        reviewEar = custom.ear
        reviewHair = custom.fur
        reviewVomit = custom.vomit
        date = custom.date
        foodIndexNumber = custom.foodIndex
        profileIndexNumber = custom.profileIndex
        
        custom.criticTextField.delegate = self
        custom.memoTextView.delegate = self
        
        addScrollView.delegate = self
        addKeyboardNotification()
        */
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationItem.title = "기록하기"
               let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
               
               custom.companyName.text = companyNameVC
               custom.productName.text = productNameVC
               custom.productImg.image = imageNameVC
               self.addScrollView.addSubview(custom)
               custom.viewDidLoad()
               custom.rootVC = self
               
               rating = custom.sendRating
               prefer = custom.sendPrefer
               review = custom.sendReview
               memo = custom.sendMemo
               pooStatus = custom.sendPooState
               pooSmell = custom.sendPooSmell
               reviewEye = custom.sendEye
               reviewEar = custom.sendEar
               reviewHair = custom.sendFur
               reviewVomit = custom.sendVomit
               //date = custom.sendDate
               foodIndexNumber = custom.sendFoodIndex
               profileIndexNumber = custom.sendProfileIndex
               
               custom.criticTextField.delegate = self
               custom.memoTextView.delegate = self
               
               addScrollView.delegate = self
               addKeyboardNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
        rightButton.title = "완료"
        //rightButton.image = UIImage(named:"icMore")
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton
        //rightButton.action = #selector(editButtonDidTap)
        //rightButton.target = self
        // 중간수정버튼 만들기
        // 밑에있는 editButtonDidTap 액션 함수 절대 지우면 안돼~~~~~~~~~~지우면 빡댁알이^^
//        rightButton.action = #selector(saveButtonDidTap)
//        rightButton.target = self
    }
    
    /*@objc private func editButtonDidTap(){
        
        let settingAlert = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
       
        let firstAction = UIAlertAction(title: "수정", style: .default, handler: nil)
       
        let secondAction = UIAlertAction(title: "삭제", style: .destructive, handler: nil)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        
        settingAlert.addAction(firstAction)
        settingAlert.addAction(secondAction)
        settingAlert.addAction(cancelAction)
        settingAlert.view.tintColor = UIColor.black
        
        present(settingAlert,animated: true,completion: nil)
        
    }*/
    
    @objc func saveButtonDidTap(){
        // 리뷰 작성 버튼 - 완료 버튼 눌렀을 때 액션
        
        ReviewService.shared.Review(rating ?? 0,
                                    prefer!,
                                    review!,
                                    memo!,
                                    pooStatus!,
                                    pooSmell!,
                                    reviewEye!,
                                    reviewEar!,
                                    reviewHair!,
                                    reviewVomit!,
                                    /*date!,*/
                                    foodIndexNumber!,
                                    profileIndexNumber!){ NetworkResult
            in switch NetworkResult{
            case .success(let token):
                //let custom = Bundle.main.loadNibNamed("PostSC", owner: self, options: nil)?[0] as! PostSC
                print("버튼작동")
//                guard let token = token as? String else {return}
//                let storyboard = UIStoryboard(name: "Post",bundle: nil)
//                let vc = storyboard.instantiateViewController(identifier: "SearchCollectVC") as! SearchCollectVC
//                vc.modalPresentationStyle = .fullScreen
//                print("받아왔어요")
                //self.navigationController?.popViewController(animated: true)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "HomeVC")as!HomeVC
                vc.modalPresentationStyle = .fullScreen
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
