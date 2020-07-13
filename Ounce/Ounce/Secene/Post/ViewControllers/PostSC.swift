//
//  PostSC.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PostSC:UIView,UITextViewDelegate {
    
    @IBOutlet weak var criticTextField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var productImg: UIImageView! // 제품사진
    @IBOutlet weak var companyName: UILabel! // 회사명
    @IBOutlet weak var productName: UILabel! // 제품이름
   
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
    
    var eye: Bool = false
    var ear: Bool = false
    var fur: Bool = false
    var vomit: Bool = false
    var rootVC: UIViewController?
    
    @IBAction func scoreBtn1selected(_ sender: Any) {
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
    }
    @IBAction func scoreBtn2selected(_ sender: Any) {
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
    }
    
    @IBAction func scoreBtn3selected(_ sender: Any) {
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        
    }
    
    
    @IBAction func scoreBtn4selected(_ sender: Any) {
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalUnselected"), for: .normal)
        
        
    }
    @IBAction func scoreBtn5selected(_ sender: Any) {
        
        scoreBtn1.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn2.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn3.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn4.setImage(UIImage(named:"icTotalSelected"), for: .normal)
        scoreBtn5.setImage(UIImage(named:"icTotalSelected"), for: .normal)
    }
    
    @IBAction func likeBtn1selected(_ sender: Any) {
        
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
    }
    
    @IBAction func likeBtn2selected(_ sender: Any) {
        
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        
    }
    @IBAction func likeBtn3selected(_ sender: Any) {
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        
    }
    @IBAction func likeBtn4selected(_ sender: Any) {
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteUnselected"), for: .normal)
        
    }
    
    @IBAction func likeBtn5selected(_ sender: Any) {
        likeBtn1.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn2.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn3.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn4.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
        likeBtn5.setImage(UIImage(named:"icFavoriteSelected"), for: .normal)
    }
    
    
    
    @IBAction func pooState1selected(_ sender: Any) {
        
        pooState1.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
        
    }
    
    @IBAction func pooState2selected(_ sender: Any) {
        
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState2.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
        pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
        pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
        
    }
    
    
    @IBAction func pooState3selected(_ sender: Any) {
        
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
               pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
               pooState3.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
               pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
               pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
    }
    
    @IBAction func pooState4selected(_ sender: Any) {
        
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
                    pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
                    pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
                    pooState4.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
                    pooState5.setImage(UIImage(named:"imgStatus"), for: .normal)
    }
    
    @IBAction func pooState5selected(_ sender: Any) {
        
        pooState1.setImage(UIImage(named:"imgStatus"), for: .normal)
                           pooState2.setImage(UIImage(named:"imgStatus"), for: .normal)
                           pooState3.setImage(UIImage(named:"imgStatus"), for: .normal)
                           pooState4.setImage(UIImage(named:"imgStatus"), for: .normal)
                           pooState5.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
    }
    
    @IBAction func pooSmell1selected(_ sender: Any) {
    
    pooSmell1.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
                              pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
                              pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
                              pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
                              pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
    }
    
    
    @IBAction func pooSmell2selected(_ sender: Any) {
        
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
                                     pooSmell2.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
                                     pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
                                     pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
                                     pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
    }
    
    @IBAction func pooSmell3selected(_ sender: Any) {
        
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
                                        pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
                                        pooSmell3.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
                                        pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
                                        pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
    }
    @IBAction func pooSmell4selected(_ sender: Any) {
        
        
        pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
                                        pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
                                        pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
                                        pooSmell4.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
                                        pooSmell5.setImage(UIImage(named:"imgStatus"), for: .normal)
    }
    @IBAction func pooSmell5selected(_ sender: Any) {
        
        
        
          pooSmell1.setImage(UIImage(named:"imgStatus"), for: .normal)
                                          pooSmell2.setImage(UIImage(named:"imgStatus"), for: .normal)
                                          pooSmell3.setImage(UIImage(named:"imgStatus"), for: .normal)
                                          pooSmell4.setImage(UIImage(named:"imgStatus"), for: .normal)
                                          pooSmell5.setImage(UIImage(named:"imgStatusSelected"), for: .normal)
    }
    
    
    @IBAction func eyeTroubleselected(_ sender: Any) {
        //eyeTrouble.layer.borderColor = UIColor.battleshipGrey.cgColor
        //eyeTrouble.layer.backgroundColor = UIColor.battleshipGrey.cgColor
        //eyeTrouble.setTitleColor(.white, for: .normal)
        if !eye{
            eye = true
            eyeTrouble.borderColor = .black
            eyeTrouble.backgroundColor = .white
            eyeTrouble.setTitleColor(.black, for: .normal)
            
        }else{
            eye = false
         
            eyeTrouble.borderColor = .pale
            eyeTrouble.backgroundColor = .white
            eyeTrouble.setTitleColor(.black, for: .normal)
            
        }
        
        
    }
    
    @IBAction func earTroubleselected(_ sender: Any) {
        
        if !ear{
             ear = true
             earTrouble.borderColor = .black
             earTrouble.backgroundColor = .white
             earTrouble.setTitleColor(.black, for: .normal)
             
         }else{
             ear = false
             earTrouble.borderColor = .pale
             earTrouble.backgroundColor = .white
             earTrouble.setTitleColor(.black, for: .normal)
             
         }
        
    }
    @IBAction func furTroubleselected(_ sender: Any) {
        
        if !fur{
             fur = true
             furTrouble.borderColor = .black
             furTrouble.backgroundColor = .white
             furTrouble.setTitleColor(.black, for: .normal)
             
         }else{
             fur = false
             furTrouble.borderColor = .pale
             furTrouble.backgroundColor = .white
             furTrouble.setTitleColor(.black, for: .normal)
             
         }
    }
    
    @IBAction func vomitTroubleselected(_ sender: Any) {
        if !vomit{
             vomit = true
             vomitTrouble.borderColor = .black
             vomitTrouble.backgroundColor = .white
             vomitTrouble.setTitleColor(.black, for: .normal)
             
         }else{
            vomit = false
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
        /*self.eyeTrouble.setTitleColor(.black,for: .normal)
        self.earTrouble.setTitleColor(.black,for: .normal)
        self.furTrouble.setTitleColor(.black, for: .normal)
        self.vomitTrouble.setTitleColor(.black, for: .normal)
        */
        
               
        memoTextView.delegate = self
        criticTextField.delegate = self
        

        
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
