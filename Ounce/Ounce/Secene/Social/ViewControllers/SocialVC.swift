//
//  SocialVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then

class SocialVC: UIViewController {

    // MARK: - UI Components
    
    // 위에 부분 팔로우/팔로워 컬렉션뷰 생성.
    let tabCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TabCVC.self, forCellWithReuseIdentifier: "TabCVC")
        // scrollIndicatorInsets 의 기능이 무엇이고 왜 . zero인가
        cv.scrollIndicatorInsets = .zero
        cv.backgroundColor = .white
        return cv
    }()
    
    let pageCV: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        // 왜 CVC.self 인지
        cv.register(PageCVC.self, forCellWithReuseIdentifier: "PageCVC")
        cv.isPagingEnabled = true
        return cv
    }()
    
//    let catNameLabel = UILabel().then {
//        $0.text = "이겨울"
//        $0.font = UIFont.systemFont(ofSize: 16)
//    }
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let followerTV = UITableView()
    let followingTV = UITableView()
    let highlightLineView = UIView()
    
    
    
    var constraints : [NSLayoutConstraint] = []
    var userSocialInfo: Follow?
    
    var followerInfo: [Follow] = []
    var followingInfo: [Follow] = []
    var direction: CGFloat?
    
    // view 계층에서 navigation은 아래에 위치하는데, 뷰 위에 왜 있는 지. bar와 item의 차이점
    func setSocialNV(catSocialName: String){
        self.navigationItem.title = catSocialName
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        setTabbar()
        setSocialNV(catSocialName: "겨울이")
        followerService()
        followingService()
        
        self.pageCV.showsHorizontalScrollIndicator = false
        self.followerTV.showsVerticalScrollIndicator = false
        self.followingTV.showsVerticalScrollIndicator = false
        
        
    }
    
    
    //이거 없으면 하이라이팅.....이상하게 됨, setTabbar()의 기능이 무엇인지.
    
    func setTabbar() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        followerTV.isScrollEnabled = false


        // delegate 호출
        collectionView(tabCV, didSelectItemAt: firstIndexPath)
        // cell select
        tabCV.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right)
    }

    private func setFollowerData(){
        
        
    }
    

}




extension SocialVC: UICollectionViewDelegate{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if scrollView == pageCV {
            let index = Int(targetContentOffset.pointee.x / tabCV.frame.width)
            let indexPath = IndexPath(item: index, section: 0)
            
            tabCV.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            collectionView(tabCV, didSelectItemAt: indexPath)
            
            if Int(direction ?? 0) > 0 {
                // >>>> 스와이프하면 스크롤은 중앙으Replace 'didSelectItemAt' with 'cellForItemAt'로
                tabCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                collectionView(tabCV, didSelectItemAt: indexPath)
            } else {
                // <<<< 스와이프하면 스크롤은 왼쪽으로
                tabCV.scrollToItem(at: indexPath, at: .left, animated: true)
                collectionView(tabCV, didSelectItemAt: indexPath)
            }
        }
        
        if scrollView == tabCV {
            let index = Int(targetContentOffset.pointee.x / pageCV.frame.width)
            let indexPath = IndexPath(item: index, section: 0)
            
            pageCV.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            collectionView(pageCV, didSelectItemAt: indexPath)
            
            if Int(direction ?? 0) > 0 {
                // >>>> 스와이프하면 스크롤은 중앙으Replace 'didSelectItemAt' with 'cellForItemAt'로
                pageCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                collectionView(pageCV, didSelectItemAt: indexPath)
            } else {
                // <<<< 스와이프하면 스크롤은 왼쪽으로
                pageCV.scrollToItem(at: indexPath, at: .left, animated: true)
                collectionView(pageCV, didSelectItemAt: indexPath)
            }
        }
        

    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView)
        
        if velocity.x < 0 {
            // -: 오른쪽에서 왼쪽 <<<
            direction = -1
        } else if velocity.x > 0 {
            // +: 왼쪽에서 오른쪽 >>>
            direction = 1
        } else {
            
        }
        

    }
}
extension SocialVC: UICollectionViewDelegateFlowLayout{
    //sizeForItemAt - 각각의 item's cell에 특정한 크기를 지정해주는 것
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case self.tabCV:
            return CGSize(width: self.view.frame.width/2, height: collectionView.frame.height)
            
        case self.pageCV:
            return CGSize(width: self.view.frame.width, height: collectionView.frame.height)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}
extension SocialVC: UICollectionViewDataSource{
    
    // 한 섹션안에 cell을 몇개 배치할 지 반환한다. 여기서는 numberOfSection을 따로 override를 하지 않았으므로 디폴트값이 1이므로 1개의 섹션에 2개의 cell!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    //각 cell에 대해 사용할 cell을 반환한다. indexPath는 섹션마다 독립적으로 카운트되는 값이다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.tabCV:
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCVC", for: indexPath) as? TabCVC else {return UICollectionViewCell()}
            tabCell.backgroundColor = .white
            
            if indexPath.row == 0 {
                tabCell.titleLabel.text = "팔로워"
                tabCell.isSelected = true //?
                
            } else {
                tabCell.titleLabel.text = "팔로잉"
                tabCell.titleLabel.textColor = .putty
                //초기 tabCV 셀렉 안되어 있을 때, 색깔 셋팅 여기에서.
            }
            return tabCell
            
        case self.pageCV:
            guard let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCVC", for: indexPath) as? PageCVC else {return UICollectionViewCell() }
            
            followerTV.delegate = self
            followerTV.dataSource = self
            followingTV.delegate = self
            followingTV.dataSource = self
            
            followerTV.separatorStyle = .none
            followingTV.separatorStyle = .none
            followerTV.isScrollEnabled = true
            
            
            if indexPath.row == 0 {
                pageCell.addSubview(followerTV)
                followerTV.snp.makeConstraints{ (make) in
                    make.top.equalTo(pageCell.snp.top)
                    make.trailing.equalTo(pageCell.snp.trailing)
                    make.leading.equalTo(pageCell.snp.leading)
                    make.bottom.equalTo(pageCell.snp.bottom)
                }
                self.followerTV.register(AcquaintanceTVC.self, forCellReuseIdentifier: "AcquaintanceTVC")
            } else {
                pageCell.addSubview(followingTV)
                followingTV.snp.makeConstraints{ (make) in
                    make.top.equalTo(pageCell.snp.top)
                    make.trailing.equalTo(pageCell.snp.trailing)
                    make.leading.equalTo(pageCell.snp.leading)
                    make.bottom.equalTo(pageCell.snp.bottom)
                }
                self.followingTV.register(AcquaintanceTVC.self, forCellReuseIdentifier: "AcquaintanceTVC")
            }
            pageCV.backgroundColor = .white
            
            return pageCell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    //    선택될 수 있는 cell을 tap하면 발생하는 이벤트.
    //    indexPath를 이용해서 해당 cell을 dequeue한 후 원하는 작업을 할 수 있다.
    //
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCV {
            
            guard let cell = tabCV.cellForItem(at: indexPath) as?
                TabCVC else{
                    NSLayoutConstraint.deactivate(constraints)
                    constraints = [highlightLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                   highlightLineView.widthAnchor.constraint(equalToConstant: self.view.frame.width/2)
                    ]
                    NSLayoutConstraint.activate(constraints)
                    return
            }
            
            NSLayoutConstraint.deactivate(constraints)
            highlightLineView.translatesAutoresizingMaskIntoConstraints = false
            constraints = [
                highlightLineView.leadingAnchor.constraint(equalTo: cell.leadingAnchor), highlightLineView.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            pageCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}


extension SocialVC: UITableViewDelegate{}

extension SocialVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == followerTV
        {
            return followerInfo.count
        }
        else{
            return followingInfo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case self.followerTV:
            guard let followerCell = tableView.dequeueReusableCell(withIdentifier: "AcquaintanceTVC", for: indexPath) as? AcquaintanceTVC else {return UITableViewCell()}
            
            
            followerCell.addContenView()
            followerCell.followInfo = followerInfo[indexPath.row]
            followerCell.setCall()
            
            return followerCell
            
        case self.followingTV:
            guard let followingCell = tableView.dequeueReusableCell(withIdentifier: "AcquaintanceTVC", for: indexPath) as? AcquaintanceTVC else {return UITableViewCell()}
            
            
            followingCell.addContenView()
            followingCell.followInfo = followingInfo[indexPath.row]
            followingCell.setCall()
            
            return followingCell
            
        default:
            return UITableViewCell()
        }
        
    }
}
// 서버통신을 위한 extension
extension SocialVC {
    
    func followerService(){
        FollowService.shared.follower(){
            responsedata in
            switch responsedata {
            case .success(let res):
                //dump(res)
                let followerList = res as! [Follow]
                
                self.followerInfo = followerList
                self.followerTV.reloadData()
                
                
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
    
    func followingService(){
        FollowService.shared.following(){
            responsedata in
            switch responsedata {
            case .success(let res):
                
                let followingList = res as! [Follow]
                
                self.followingInfo = followingList
                self.followingTV.reloadData()
                
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

