//
//  BrowseSearchVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class BrowseSearchVC: UIViewController {
    
    let tabCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(BrowseTabCVCell.self, forCellWithReuseIdentifier: "BrowseTabCVCell")
        cv.scrollIndicatorInsets = .zero
        cv.isScrollEnabled = false
        return cv
    }()
    
    let pageCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(BrowsePageCVCell.self, forCellWithReuseIdentifier: "BrowsePageCVCell")
        cv.isPagingEnabled = true
        return cv
    }()
    let headerView = UIView()
    let highlightView = UIView()
    let userTV = UITableView()
    let backButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .black
    }
    //    let productTV = UITableView(frame: CGRect.init(), style: .grouped).then{
    //        $0.backgroundView?.backgroundColor = .white
    //    }
    let productTV = UITableView()
    let searchView = UIView().then {
        $0.backgroundColor = .whiteThree
        $0.setRounded(radius: 8)
    }
    let searchTextField = UITextField().then {
        $0.placeholder = "검색어를 입력해주세요"
        $0.tintColor = .black
    }
    let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "icSearch"), for: .normal)
        $0.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
    }
    let backGroundButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapBackgroundButton), for: .touchUpInside)
        $0.backgroundColor = .black
        $0.alpha = 0.4
    }
    
    var direction: CGFloat?
    var constraints: [NSLayoutConstraint] = []
    var user: [User]?
    var product: [CatProduct]?
    var pageIndex = [1, 10]
    var userPageIndex = [1, 10]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        setTabbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension BrowseSearchVC {
    @objc func didTapSearch(){
        pageIndex = [1, 10]
        userPageIndex = [1, 10]
        searchUser()
        searchProduct()
    }
    
    @objc func didTapSortButton(){
        print(#function)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SortingVC") as! SortingVC
        vc.modalPresentationStyle = .overFullScreen
        vc.sortingList = ["기호도순","총점순"]
        self.present(vc, animated: false)
    }
    
    @objc func didTapBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapBackgroundButton(){
        print(#function)
    }
    
    func setTabbar() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        // delegate 호출
        collectionView(tabCV, didSelectItemAt: firstIndexPath)
        // cell select
        tabCV.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right)
    }

    
}

extension BrowseSearchVC: UIScrollViewDelegate {
    
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
    
    // 스크롤 방향을 알아내기 위한 함수
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

extension BrowseSearchVC: UICollectionViewDelegate { }
extension BrowseSearchVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView:UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
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
extension BrowseSearchVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.tabCV:
            collectionView.register(BrowseTabCVCell.self,
                                    forCellWithReuseIdentifier: "BrowseTabCVCell")
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowseTabCVCell", for: indexPath) as? BrowseTabCVCell else {return UICollectionViewCell()}
            tabCell.backgroundColor = .white
            if indexPath.row == 0 {
                tabCell.titleLabel.text = "사용자"
                tabCell.isSelected = true
            } else {
                tabCell.titleLabel.text = "제품"
                tabCell.titleLabel.textColor = .putty
            }
            return tabCell
            
        case self.pageCV:
            guard let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowsePageCVCell", for: indexPath) as? BrowsePageCVCell else {return UICollectionViewCell()}
            collectionView.register(BrowsePageCVCell.self, forCellWithReuseIdentifier: "BrowsePageCVCell")
            
            userTV.delegate = self
            userTV.dataSource = self
            userTV.separatorStyle = .none
            
            productTV.delegate = self
            productTV.dataSource = self
            productTV.separatorStyle = .none
            pageCell.backgroundView?.backgroundColor = .white
            
            if indexPath.row == 0 {
                
                pageCell.addSubview(userTV)
                userTV.snp.makeConstraints { (make) in
                    make.top.equalTo(pageCell.snp.top)
                    make.trailing.equalTo(pageCell.snp.trailing)
                    make.leading.equalTo(pageCell.snp.leading)
                    make.bottom.equalTo(pageCell.snp.bottom)
                }
                self.userTV.register(BrowseUserTVCell.self,
                                     forCellReuseIdentifier: "BrowseUserTVCell")
            } else {
                pageCell.addSubview(productTV)
                productTV.snp.makeConstraints { (make) in
                    make.top.equalTo(pageCell.snp.top)
                    make.trailing.equalTo(pageCell.snp.trailing)
                    make.leading.equalTo(pageCell.snp.leading)
                    make.bottom.equalTo(pageCell.snp.bottom)
                }
                self.productTV.register(BrowseProductTVCell.self,
                                        forCellReuseIdentifier: "BrowseProductTVCell")
            }
            
            pageCV.backgroundColor = .white
            
            return pageCell
            
        default:
            return UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCV {
            guard let cell = tabCV.cellForItem(at: indexPath) as? BrowseTabCVCell else {
                NSLayoutConstraint.deactivate(constraints)
                constraints = [
                    highlightView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    highlightView.widthAnchor.constraint(equalToConstant: self.view.frame.width/2)
                ]
                NSLayoutConstraint.activate(constraints)
                return
            }
            
            NSLayoutConstraint.deactivate(constraints)
            highlightView.translatesAutoresizingMaskIntoConstraints = false
            constraints = [
                highlightView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                highlightView.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            pageCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension BrowseSearchVC: UITableViewDelegate {}
extension BrowseSearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case self.userTV:
            return 84
        case self.productTV:
            return 82
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.userTV:
            let userInfoCount = self.user?.count
            
            if userInfoCount == 0 {
                userTV.setEmptyView(title: "해당하는 검색 결과가 없습니다", message: "")
            } else {
                userTV.restore()
            }
            
            return userInfoCount ?? 0
        case self.productTV:
            let productInfoCount = self.product?.count
            
            if productInfoCount == 0 {
                productTV.setEmptyView(title: "해당하는 검색 결과가 없습니다", message: "")
            } else {
                productTV.restore()
            }
            
            return productInfoCount ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case self.userTV:
            guard let userCell = tableView.dequeueReusableCell(withIdentifier: "BrowseUserTVCell",
                                                               for: indexPath) as? BrowseUserTVCell else
            {return UITableViewCell()}
            userCell.user = user?[indexPath.row]
            userCell.cellConstraint()
            userCell.cellService()
            
            
            return userCell
        case self.productTV:
            guard let productCell = tableView.dequeueReusableCell(withIdentifier: "BrowseProductTVCell",
                                                                  for: indexPath) as? BrowseProductTVCell else
            {return UITableViewCell()}
            productCell.product = product?[indexPath.row]
            productCell.cellConstraint()
            productCell.cellService()
            
            return productCell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == productTV {
            return 48
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == productTV {
            let sortButton = UIButton().then {
                $0.setRounded(radius: 8)
                $0.borderColor = .pale
                $0.borderWidth = 1
                $0.setTitle("기호순       ", for: .normal)
                $0.setTitleColor(.greyishBrownTwo, for: .normal)
                $0.titleLabel?.font = Font.errorLabel
                $0.addTarget(self, action: #selector(didTapSortButton), for: .touchUpInside)
            }
            
            let buttonImage = UIButton().then {
                $0.setImage(UIImage(named: "1927"), for: .normal)
            }
            
            headerView.addSubview(sortButton)
            headerView.addSubview(buttonImage)
            
            sortButton.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.width.equalTo(96)
                make.height.equalTo(32)
            }
            
            buttonImage.snp.makeConstraints { (make) in
                make.centerY.equalTo(sortButton.snp.centerY)
                make.trailing.equalToSuperview().offset(-23)
                make.width.equalTo(20)
                make.height.equalTo(20)
            }
            headerView.backgroundColor = .white
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
        case self.userTV:
            userTV.backgroundColor = .white
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            vc.modalPresentationStyle = .overFullScreen
            vc.profileIndex = user?[indexPath.row].profileIdx
            vc.isOtherUser = true
            navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
            
        case self.productTV:
            print(product?[indexPath.row].foodImg ?? "")
            tableView.backgroundColor = .white
            productTV.backgroundColor = .white
            let sb = UIStoryboard(name: "ProductDetail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
            vc.modalPresentationStyle = .overFullScreen
            vc.foodIndex = product?[indexPath.row].foodIdx
            navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(vc, animated: true)

        default:
            break
        }
    }
    
}

extension BrowseSearchVC {
    @objc func searchUser(){
        SearchService.shared.searchUser(searchTextField.text ?? "",
                                        userPageIndex[0],
                                        userPageIndex[1]) { (responseData) in
            switch responseData {
            case .success(let res) :
                let response = res as! [User]
                self.user = response
                self.userTV.reloadData()
            case .requestErr(_):
                print("")
            case .pathErr:
                print("")
            case .serverErr:
                print("")
            case .networkFail :
                print("")
            }
        }
    }
    
    @objc func searchProduct(){
        print(#function)
        SearchService.shared.searchProduct(searchTextField.text ?? "",
                                           pageIndex[0],
                                           pageIndex[1]) { (responseData) in
            switch responseData {
            case .success(let res) :
                let response = res as! [CatProduct]
                self.product = response
                self.productTV.reloadData()
                self.pageIndex[0] = self.pageIndex[1] + 1
                self.pageIndex[1] = self.pageIndex[1] + 10
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail :
                print("networkFail")
            }
        }
    }

}
