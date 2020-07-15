//
//  HomeVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Foundation

class HomeVC: UIViewController {
    
    @IBOutlet weak var reviewTV: UITableView!
    
    var profiles: [MyProfile]?
    var reviews: [UserReviews]?
    var profileIndex: Int?
    var isOtherUser: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTV.delegate = self
        reviewTV.dataSource = self
        
        
        // ReviewTableViewCell xib 연결
        let nibName = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        
        // HeaderCell xib 연결
        let nibName1 = UINib(nibName: "HeaderCell", bundle: nil)
        
        reviewTV.register(nibName, forCellReuseIdentifier: "ReviewTableViewCell")
        
        reviewTV.register(nibName1, forCellReuseIdentifier: "HeaderCell")
        
        
        //테이블 셀 라인 없애기
        self.reviewTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //        self.setupLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if !isOtherUser {
            
            navigationController?.isNavigationBarHidden = true
            
            
        } else {
            
            didTapBackButton()
          
//            navigationController?.isNavigationBarHidden = false

        }
        dateReviewService(1, 1, 10)
        profileService(1)
        
        
        // MARK: - 윤진이 뷰에서 제품 등록해주고 완료 누르면, 다시 시간 순으로 정렬
        //        func dateReviewService(_ profileIndex: Int, _ start: Int, _ end: Int) {
        //
        //            ContentService.shared.dateReviews(String(profileIndex), String(start), String(end)) { responsedata in
        //                switch responsedata {
        //                case .success(let res):
        //                    self.reviews = res as! [UserReviews]
        //                    self.reviewTV.reloadData()
        //                case .requestErr(_):
        //                    print("reupload product request error")
        //
        //                case .pathErr:
        //                    print("reupload product pathErr")
        //
        //                case .serverErr:
        //                    print(" reupload product serverErr")
        //
        //                case .networkFail :
        //                    print("reupload product failure")
        //
        //                }
        //            }
        //
        //        }
        
    }
    
    // 위에 viewWillAppear하고 중복 아닌가?,,
    //    func setupLayout() {
    //        self.navigationController?.setNavigationBarHidden(true, animated: false)
    //    }
    
}

extension HomeVC : UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - TableView Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else {
            return reviews?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            // settingBtn 클릭 시 -> SettingView로 이동
            cell.settingButton.tag = indexPath.row
            cell.settingButton.addTarget(self, action: #selector(didTapSettingButton),
                                         for: .touchUpInside)
            // 팔로워버튼 클릭 시 -> FollowerView로 이동
            cell.follower.tag = indexPath.row
            cell.follower.addTarget(self, action: #selector(didTapFollowerButton),
                                    for: .touchUpInside)
            cell.following.tag = indexPath.row
            cell.following.addTarget(self, action: #selector(didTapFollowingButton),
                                     for: .touchUpInside)
            // 계정버튼 클릭 시 -> AcountView로 이동
            cell.accountButton.tag = indexPath.row
            cell.accountButton.addTarget(self, action: #selector(didTapAccountButton),
                                         for: .touchUpInside)
            
            // 서버 통신
            cell.profile = profiles?[indexPath.row]
            cell.cellProfile()
            
            if !isOtherUser {
                
                // 내 프로필
                
            }
            else{
                
                // 다른 사람 프로필 화면 -> 뒤로 나가는 백버튼 만들기 하려고 했는데,, 팔로우 버튼도 생겨야 함..
                // 그래서 세팅버튼 지우는게 의미없음^^
                cell.settingButton.isHidden = true
                
            }
  
            return cell
        }
        else{
            let reviewCell = reviewTV.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
            reviewCell.rootVC = self
            reviewCell.review = reviews?[indexPath.row]
            
            
            reviewCell.cellService()
            
            return reviewCell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 1 {
            let sb = UIStoryboard(name: "ProductDetail", bundle: nil)
            let dvc = sb.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
            dvc.modalPresentationStyle = .overFullScreen
            navigationController?.isNavigationBarHidden = false
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                               style: .plain,
                                                               target: nil,
                                                               action: nil)
            /* 셀 클릭시 index값 넘겨주기 */
            dvc.foodIndex = reviews?[indexPath.row].reviewIdx
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 179
        }
        else{
            return 86
        }
    }
    
    
    
    // MARK: - header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1{
            return 47
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            
            let headerCell = reviewTV.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            
            // xib 파일 - headerCell
            headerCell.rootVC = self
            
            return headerCell
        }
        else{
            let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
            let myView = UIView(frame: rect)
            
            return myView
        }
        
    }
    
    
}

extension HomeVC {
    
    // 여기 부분이 백 버튼 만드는 부분
    @objc func didTapBackButton(){
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "HomeVC") as! HomeVC
        

        // MARK: - 여기 부분은 뷰 전환할 때 중복
//       self.navigationController?.navigationBar.isHidden = false
//      self.navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    
    
    @objc func didTapSettingButton(){
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "SettingVC") as! SettingVC
        
        // navigationBar.isHidden -> 네비게이션 바 숨김
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    @objc func didTapFollowerButton(){
        let storyboard = UIStoryboard(name: "Social", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "SocialVC") as! SocialVC
        navigationController?.navigationBar.isHidden = false
        dvc.profileIndex = profileIndex
        dvc.isFollower = true
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @objc func didTapFollowingButton(){
        let storyboard = UIStoryboard(name: "Social", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "SocialVC") as! SocialVC
        navigationController?.navigationBar.isHidden = false
        dvc.profileIndex = profileIndex
        dvc.isFollower = false
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    @objc func didTapAccountButton(){
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "AccountVC") as! AccountVC
        
        self.present(dvc, animated: false)
    }
    
    
    
}


// MARK: - 서버 통신 코드
extension HomeVC {
    
    // 홈 뷰: 프로필 조회(GET)
    func profileService(_ profileIndex: Int) {
        
        MyProfileService.shared.myprofile(String(profileIndex)) { responsedata in
            switch responsedata {
            case .success(let data):
                self.profiles = data as? [MyProfile]
                
                self.reviewTV.reloadData()
                
                print("홈 뷰 : 프로필 조회 성공")
                
                
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
    
    // 홈 뷰: 리뷰 조회(POST)
    func dateReviewService(_ profileIndex: Int, _ start: Int, _ end: Int) {
        
        ContentService.shared.dateReviews(String(profileIndex), String(start), String(end)) { responsedata in
            switch responsedata {
            case .success(let res):
                self.reviews = res as! [UserReviews]
                
                dump(self.reviews)
                
                self.reviewTV.reloadData()
                print("홈 뷰 : 리뷰 조회 성공")
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
