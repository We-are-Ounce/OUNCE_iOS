//
//  AccountVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SwiftKeychainWrapper

class AccountVC: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var touchView: UIView!
    @IBOutlet weak var accountCV: UICollectionView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addAccountBtn: UIButton!
    
    var judgeLimit: LimitAccount?
    var delegate: AccountDelegate?
    // MARK: - UI components
    
    
    
    // MARK - Variable and properties
    
    
    var otherAccountInfo: [OtherAccount] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = .none
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        self.backgroundDismiss()
        
        accountCV.delegate = self
        accountCV.dataSource = self
        
        setFunc()
        loadAccount()
        
    }
    
    
    func setFunc(){
        
        addAccountBtn.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
    }
    
    @objc func didTapAdd(){
        limitAccount()
        
    }
    
    func backgroundDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(_:))))
    }
    
    
    
    
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    
}


extension AccountVC: UICollectionViewDelegate {
    
}

extension AccountVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherAccountInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChangeAccountCVC.identifier, for: indexPath) as? ChangeAccountCVC else{ return UICollectionViewCell() }
        
        cell.accountInfo = otherAccountInfo[indexPath.row]
        cell.setCall()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        KeychainWrapper.standard.set(otherAccountInfo[indexPath.row].profileIdx, forKey: "currentProfile")
        delegate?.didClickedAccount()
        dismiss(animated: false, completion: nil)
    }
    
}

extension AccountVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 78)
    }
    
}

extension AccountVC {
    
    func limitAccount() {
        
        LimitAccountService.shared.limitAccount() { responsedata
            in
            
            switch responsedata {
            case . success(let res):
                dump(res)
                let response = res as! LimitAccount
                
                self.judgeLimit = response
                dump(res)
                if self.judgeLimit?.possibleAddProfile == true {
                    //print("다른 뷰로")
                    KeychainWrapper.standard.set(true, forKey: "newProfile")
                    let storyboard = UIStoryboard(name: "Register", bundle: nil)
                    
                    let dvc = storyboard.instantiateViewController(identifier: "RegisterNavVC") as! RegisterNavVC
                    
                    dvc.modalPresentationStyle = .overFullScreen

                    self.present(dvc, animated: true, completion: nil)
                    
                } else {
                    self.simpleAlert(title: "이미 생성된 계정이", message: "제한된 계정의 수를 넘었습니다.")
                }
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
    
    func loadAccount() {
        OtherACService.shared.loadOther() {
            responsedata in
            switch responsedata {
            case .success(let res):
                //dump(res)
                let accountList = res as! [OtherAccount]
                
                self.otherAccountInfo = accountList
                
                self.accountCV.reloadData()
                
                
                
            case .requestErr(_):
                print("request error")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".failureErr")
                
            }
        }
    }
}

protocol AccountDelegate {
    func didClickedAccount()
}
