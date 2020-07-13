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
    var userSocialInfo: SocialList?
    
    var followerInfo: [SocialList] = []
    var followingInfo: [SocialList] = []
    var direction: CGFloat?
    
    // view 계층에서 navigation은 아래에 위치하는데, 뷰 위에 왜 있는 지. bar와 item의 차이점
    func setSocialNV(catSocialName: String){
        self.navigationItem.title = catSocialName
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        setTabbar()
        setFollowerData()
        setSocialNV(catSocialName: "겨울이")
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
        let datum_1 = SocialList(catName: "호세", catWeight: "65", catAge: "25")
        let datum_2 = SocialList(catName: "정균", catWeight: "75", catAge: "37")
        let datum_3 = SocialList(catName: "준현", catWeight: "65", catAge: "26")
        let datum_4 = SocialList(catName: "현우", catWeight: "90", catAge: "24")
        let datum_5 = SocialList(catName: "효원", catWeight: "30", catAge: "24")
        
        followerInfo = [datum_1,datum_2,datum_3,datum_4,datum_5]
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
        
        if scrollView == self.scrollView {
            followerTV.isScrollEnabled = (self.scrollView.contentOffset.y >= 40)
            followingTV.isScrollEnabled = (self.scrollView.contentOffset.y >= 40)
        }

        if scrollView == self.followerTV || scrollView == self.followingTV {
            self.followerTV.isScrollEnabled = (followerTV.contentOffset.y > 0)
            self.followingTV.isScrollEnabled = (followingTV.contentOffset.y > 0)
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
            //userTV.separatorStyle = .none
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
                    constraints = [highlightLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor), highlightLineView.widthAnchor.constraint(equalToConstant: 80)
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
        return followerInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let followerCell = tableView.dequeueReusableCell(withIdentifier: "AcquaintanceTVC", for: indexPath) as? AcquaintanceTVC else {return UITableViewCell()}
        
        followerCell.addContenView()
        
        followerCell.setDataInformation(catSocialName: followerInfo[indexPath.row].catName, catSocialWeight: followerInfo[indexPath.row].catWeight, catSocialAge: followerInfo[indexPath.row].catAge)
        return followerCell
    }
}


