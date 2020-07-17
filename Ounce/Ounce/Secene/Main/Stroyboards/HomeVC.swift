//
//  HomeVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Foundation

import SwiftKeychainWrapper


class HomeVC: UIViewController, HomeViewDelegate {
    
    func didSortingClick(data: String) {
        
        if data == "기호도순" {
            
            preferReviewService(profileIndex ?? 0, pageIndex [0], pageIndex[1])
            
        
        }
        else if data == "총점순"{
            
          totalReviewService(profileIndex ?? 0,pageIndex[0], pageIndex[1])
  
        }
        else {
            
            dateReviewService(profileIndex ?? 0, pageIndex[0], pageIndex[1])

        }
        
    }
    
    
    @IBOutlet weak var reviewTV: UITableView!
    
    var profiles: MyProfile?
    var otherProfiles: OtherProfile?
    var reviews: [UserReviews]?
    var totals: [ReviewTotal]?
    var prefers: [ReviewPrefer]?
    
    var profileIndex: Int?
    var isOtherUser: Bool = false
    
    var currentProfileIndex: Int?
    var pageIndex: [Int] = [0, 9]
    var detailReview: [DetailReview]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTV.delegate = self
        reviewTV.dataSource = self
        currentProfileIndex = KeychainWrapper.standard.integer(forKey: "currentProfile")
        print("123: ",currentProfileIndex ?? 0)
        // ReviewTableViewCell xib 연결
        let nibName = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        
        // HeaderCell xib 연결
        let nibName1 = UINib(nibName: "HeaderCell", bundle: nil)
        
        reviewTV.register(nibName, forCellReuseIdentifier: "ReviewTableViewCell")
        reviewTV.register(OtherProfileTVCell.self, forCellReuseIdentifier: "OtherProfileTVCell")
        reviewTV.register(nibName1, forCellReuseIdentifier: "HeaderCell")
        
        
        //테이블 셀 라인 없애기
        self.reviewTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //        totalReviewService(1, 2, 10)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.isNavigationBarHidden = true
        if !isOtherUser {
            dateReviewService(currentProfileIndex ?? 0, pageIndex[0], pageIndex[1])
            profileService(currentProfileIndex ?? 0)
        } else {
            didTapBackButton()
            dateReviewService(profileIndex ?? 0, pageIndex[0], pageIndex[1])
            otherProfileService(profileIndex ?? 0)
            
        }
        
    }
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
            let count = reviews?.count ?? 0
            
            // let total = totals?.count ?? 0
            if count == 0 {
                return 0
            } else {
                return count
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            if currentProfileIndex == profileIndex || profileIndex == nil {
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
                cell.editProfileButton.tag = indexPath.row
                cell.editProfileButton.addTarget(self, action: #selector(didEditProfileButton),
                                                 for: .touchUpInside)
                
                cell.profile = profiles?.profileInfoArray[0]
                cell.cellProfile()
                let bgColorView = UIView()
                bgColorView.backgroundColor = UIColor.white
                cell.selectedBackgroundView = bgColorView
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OtherProfileTVCell", for: indexPath) as! OtherProfileTVCell
                cell.profile = otherProfiles
                let bgColorView = UIView()
                bgColorView.backgroundColor = UIColor.white
                cell.selectedBackgroundView = bgColorView
                cell.rootVC = self
                cell.makeConstraint()
                cell.setProfile()
                cell.profileIndex = profileIndex
                
                return cell
            }
        } else {
            let reviewCell = reviewTV.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
            reviewCell.rootVC = self
            reviewCell.review = reviews?[indexPath.row]
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            reviewCell.selectedBackgroundView = bgColorView
            
            
            reviewCell.cellService()
            
            return reviewCell
            
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let sb = UIStoryboard(name: "Post", bundle: nil)
            let dvc = sb.instantiateViewController(withIdentifier: "PostVC") as! PostVC
            dvc.modalPresentationStyle = .overFullScreen
            navigationController?.isNavigationBarHidden = false
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                               style: .plain,
                                                               target: nil,
                                                               action: nil)
            navigationItem.rightBarButtonItem = UIBarButtonItem()

            if isOtherUser {
                dvc.isOther = true
            }
            
            /* 셀 클릭시 index값 넘겨주기 */
//            dvc.reviewIndexNumber = reviews?[indexPath.row].reviewIdx
            dvc.reviewIdx = reviews?[indexPath.row].reviewIdx
            dvc.isEdit = true
            
            self.navigationController?.pushViewController(dvc, animated: true)
            reviewDetailService(dvc.reviewIdx ?? 0)
            
            
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
            headerCell.reviews = profiles?.reviewCountAll
            headerCell.reviewCount()
            
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        
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
        
        dvc.modalPresentationStyle = .overFullScreen
        
        self.present(dvc, animated: false)
    }
    
    @objc func didEditProfileButton(){
        let storyboard = UIStoryboard(name: "Register", bundle:  nil)
        let dvc = storyboard.instantiateViewController(identifier: "RegisterNavVC") as! RegisterNavVC
        dvc.modalPresentationStyle = .overFullScreen
        present(dvc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

// MARK: - 서버 통신 코드
extension HomeVC {
    
    // 홈 뷰: 프로필 조회(GET)
    func profileService(_ profileIndex: Int) {
        MyProfileService.shared.myProfile(String(profileIndex)) { responsedata in
            switch responsedata {
            case .success(let data):
                self.profiles = data as? MyProfile
                
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
    
    func otherProfileService(_ profileIndex: Int) {
        MyProfileService.shared.otherProfile(String(profileIndex)) { responsedata in
            switch responsedata {
            case .success(let data):
                self.otherProfiles = data as? OtherProfile
                
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
    
    // 홈 뷰: 리뷰 시간 순 조회(GET) - 고정
    func dateReviewService(_ profileIndex: Int, _ start: Int, _ end: Int) {
        
        ContentService.shared.dateReviews(String(profileIndex), String(start), String(end)) { responsedata in
            switch responsedata {
            case .success(let res):
                self.reviews = res as? [UserReviews]
                print("홈 뷰 시간 순 Service")
                dump(self.reviews)

                DispatchQueue.main.async {
                    self.reviewTV.reloadData()
                }
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
    
    // MARK: - 테이블 뷰 선택 시 리뷰 조회 화면
    func reviewDetailService(_ reviewIndex: Int){
        
        ReviewUpdateService.shared.reviewDetail(reviewIndex){ responsedata in
            switch responsedata {
                
            case .success(let res):
                self.detailReview = res as? [DetailReview]
                
                
                print("테이블 뷰 선택 후 리뷰 조회 성공")
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
    
    // 홈 뷰: 리뷰 총점 조회(GET)
    func totalReviewService(_ profileIndex: Int, _ start: Int, _ end: Int) {
        
        ReviewTotalService.shared.totalReviews(String(profileIndex), String(start), String(end)) { responsedata in
            switch responsedata {
            case .success(let res):
                self.totals = res as? [ReviewTotal]
                
                print("리뷰 총점 서버 들어오기")
                dump(self.totals)
                
                DispatchQueue.main.async {
                    self.reviewTV.reloadData()
                }
                self.reviewTV.reloadData()
                print("홈 뷰 : 총점 성공")
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
    
    // 홈 뷰: 리뷰 기호도 조회(GET)
      func preferReviewService(_ profileIndex: Int, _ start: Int, _ end: Int) {
          
          ReviewPreferService.shared.preferReviews(String(profileIndex), String(start), String(end)) { responsedata in
              switch responsedata {
              case .success(let res):
                  self.prefers = res as? [ReviewPrefer]
                  
                  print("기호도 서버 들어오기")
                  dump(self.prefers)
                  
                  DispatchQueue.main.async {
                      self.reviewTV.reloadData()
                  }
                  self.reviewTV.reloadData()
                  print("홈 뷰 : 기호도 성공")
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
