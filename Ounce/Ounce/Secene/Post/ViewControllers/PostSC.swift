//
//  PostSC.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostSC:UIView,UITextViewDelegate {
    
    @IBOutlet weak var criticTextField: UITextField! // 한줄 리뷰
    @IBOutlet weak var memoTextView: UITextView! // 메모
    @IBOutlet weak var productImg: UIImageView! // 제품사진
    @IBOutlet weak var companyName: UILabel! // 회사명
    @IBOutlet weak var productName: UILabel! // 제품이름
    
    @IBOutlet weak var foodDry: UIButton!
    @IBOutlet weak var foodMeat1: UIButton!
    @IBOutlet weak var foodMeat2: UIButton!
    @IBOutlet weak var textLineView: UIView!
    
    @IBOutlet weak var scoreBtn1: UIButton!
    @IBOutlet weak var scoreBtn2: UIButton!
    @IBOutlet weak var scoreBtn3: UIButton!
    @IBOutlet weak var scoreBtn4: UIButton!
    @IBOutlet weak var scoreBtn5: UIButton!
    @IBOutlet weak var likeBtn1: UIButton!
    @IBOutlet weak var likeBtn2: UIButton!
    @IBOutlet weak var likeBtn3: UIButton!
    @IBOutlet weak var likeBtn4: UIButton!
    @IBOutlet weak var likeBtn5: UIButton!
    /*변상태 설정 버튼*/
    @IBOutlet weak var pooState1: UIButton!
    @IBOutlet weak var pooState2: UIButton!
    @IBOutlet weak var pooState3: UIButton!
    @IBOutlet weak var pooState4: UIButton!
    @IBOutlet weak var pooState5: UIButton!
    /*변냄새 설정 버튼*/
    @IBOutlet weak var pooSmell1: UIButton!
    @IBOutlet weak var pooSmell2: UIButton!
    @IBOutlet weak var pooSmell3: UIButton!
    @IBOutlet weak var pooSmell4: UIButton!
    @IBOutlet weak var pooSmell5: UIButton!
    /*trouble*/
    @IBOutlet weak var eyeTrouble: UIButton!
    @IBOutlet weak var earTrouble: UIButton!
    @IBOutlet weak var furTrouble: UIButton!
    @IBOutlet weak var vomitTrouble: UIButton!
    
    var rating: Int = 1
    var prefer: Int = 1
    var review: String = "리뷰"
    var memo: String = "메모"
    var pooState: Int = 1
    var pooSmell : Int = 1
    var eye: Int = 0
    var ear: Int = 0
    var fur: Int = 0
    var vomit: Int = 0
    //var date: String = "해떴다"
    var foodIndex: Int = 10
    var profileIndex: Int = 19
    
    // 데이터 보내기
    var sendRating: Int?
    var sendPrefer: Int?
    var sendReview: String?
    var sendMemo: String?
    var sendPooState: Int?
    var sendPooSmell : Int?
    var sendEye: Int?
    var sendEar: Int?
    var sendFur: Int?
    var sendVomit: Int?
    //var sendDate: String?
    var sendFoodIndex: Int?
    var sendProfileIndex: Int?
    var rootVC: UIViewController?
    
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!
    
    
    @IBAction func scoreBtn1selected(_ sender: Any) {
        rating = 1
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        
    }
    @IBAction func scoreBtn2selected(_ sender: Any) {
        rating = 2
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
       
    }
    
    @IBAction func scoreBtn3selected(_ sender: Any) {
        rating = 3
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
       
        
    }
    
    
    @IBAction func scoreBtn4selected(_ sender: Any) {
        rating = 4
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
       
        
    }
    @IBAction func scoreBtn5selected(_ sender: Any) {
        rating = 5
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalSelected"), for: .normal)
      
    }
    
    @IBAction func likeBtn1selected(_ sender: Any) {
        prefer = 1
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
 
    }
    
    @IBAction func likeBtn2selected(_ sender: Any) {
        prefer = 2
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
  
        
    }
    @IBAction func likeBtn3selected(_ sender: Any) {
        prefer = 3
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)

    }
    @IBAction func likeBtn4selected(_ sender: Any) {
        prefer = 4
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)

        
    }
    
    @IBAction func likeBtn5selected(_ sender: Any) {
        prefer = 5
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)

    }
    
    
    
    @IBAction func pooState1selected(_ sender: Any) {
        pooState = 1
        pooState1.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
        
        
    }
    
    @IBAction func pooState2selected(_ sender: Any) {
        pooState = 2
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
       
        
    }
    
    
    @IBAction func pooState3selected(_ sender: Any) {
        pooState = 3
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
       
    }
    
    @IBAction func pooState4selected(_ sender: Any) {
        
        pooState = 4
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
        
    }
    
    @IBAction func pooState5selected(_ sender: Any) {
        
        pooState = 5
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
     
    }
    
    @IBAction func pooSmell1selected(_ sender: Any) {
        
        pooSmell = 1
        pooSmell1.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
     
    }
    
    
    @IBAction func pooSmell2selected(_ sender: Any) {
        
        pooSmell = 2
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell2.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
   
    }
    
    @IBAction func pooSmell3selected(_ sender: Any) {
        pooSmell = 3
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell3.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
       
    }
    @IBAction func pooSmell4selected(_ sender: Any) {
        
        pooSmell = 4
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell4.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
       
    }
    @IBAction func pooSmell5selected(_ sender: Any) {
        
        
        pooSmell = 5
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooSmell5.setImage(UIImage(named:"imgStatusSelected"), for: .normal)

    }
    
    
    @IBAction func eyeTroubleselected(_ sender: Any) {
        if eye == 0 {
            eye = 1
            eyeTrouble.borderColor = .black
            eyeTrouble.backgroundColor = .white
            eyeTrouble.setTitleColor(.black, for: .normal)
          
        }else {
            eye = 0
            
            eyeTrouble.borderColor = .pale
            eyeTrouble.backgroundColor = .white
            eyeTrouble.setTitleColor(.black, for: .normal)
         
            
        }
        
        
    }
    
    @IBAction func earTroubleselected(_ sender: Any) {
        
        if ear == 0 {
            ear = 1
            earTrouble.borderColor = .black
            earTrouble.backgroundColor = .white
            earTrouble.setTitleColor(.black, for: .normal)
            
        }else{
            ear = 0
            earTrouble.borderColor = .pale
            earTrouble.backgroundColor = .white
            earTrouble.setTitleColor(.black, for: .normal)
            
        }
        
    }
    @IBAction func furTroubleselected(_ sender: Any) {
        
        if fur == 0 {
            fur = 1
            furTrouble.borderColor = .black
            furTrouble.backgroundColor = .white
            furTrouble.setTitleColor(.black, for: .normal)
            
        }else {
            fur = 0
            furTrouble.borderColor = .pale
            furTrouble.backgroundColor = .white
            furTrouble.setTitleColor(.black, for: .normal)
            
        }
    }
    
    @IBAction func vomitTroubleselected(_ sender: Any) {
        if vomit == 0 {
            vomit = 1
            vomitTrouble.borderColor = .black
            vomitTrouble.backgroundColor = .white
            vomitTrouble.setTitleColor(.black, for: .normal)
            
        }else{
            vomit = 0
            vomitTrouble.borderColor = .pale
            vomitTrouble.backgroundColor = .white
            vomitTrouble.setTitleColor(.black, for: .normal)
           
        }
    }
    func viewDidLoad(){
        
        self.memoTextView.layer.borderWidth = 1.0
        self.memoTextView.layer.borderColor = UIColor.pale.cgColor
        self.memoTextView.layer.cornerRadius = 8.0
        
        
        self.eyeTrouble.borderColor = .pale
        self.earTrouble.borderColor = .pale
        self.furTrouble.borderColor = .pale
        self.vomitTrouble.borderColor = .pale
        
       
        memoTextView.delegate = self
        criticTextField.delegate = self
        
        print("sc에서 보내주는 평가값: \(sendRating)")
        sendRating = rating
        sendPrefer = prefer
        
        sendReview = review
        sendMemo = memo
        
        
        
        sendPooState = pooState
        sendPooSmell = pooSmell
        sendEye = eye
        sendEar = ear
        sendFur = fur
        sendVomit = vomit
        sendFoodIndex = foodIndex
        sendProfileIndex = profileIndex
    }
    func viewDidAppear(){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        // 키보드 바깥 뷰 아무데나 터치하면 키보드 다시 들어가는 코드
        self.rootVC?.view.endEditing(true)
    }
    
}

extension PostSC: UITextFieldDelegate {
    
    
    private func addKeyboardObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.memoTextView.transform = .init(translationX: 0, y: -300)
        })
    }
    
}

