//
//  ProductDetailVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import SafariServices

import Then
import SnapKit
import SwiftKeychainWrapper

class ProductDetailVC: UIViewController {

    // MARK: - UI components

    let productTV = UITableView(frame: CGRect.init(), style: .grouped).then{
        $0.backgroundView?.backgroundColor = .white
    }

    let headerView = UIView()

    let headerIMG = UIImageView().then {
        $0.backgroundColor = .pale
        $0.setRounded(radius: 8)
        $0.frame = CGRect.init(x: 0, y: 0, width: 89, height: 89)
    }
    let headerCompanyNameLabel = UILabel().then {
        $0.text = "제품 회사이름"
        $0.font = Font.errorLabel
        $0.textColor = .black
    }
    let headerProductNameLabel = UILabel().then {
        $0.text = "제품 이름"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
    }
    let firstCategoryLabel = UILabel().then {
        $0.text = "건식"
        $0.textColor = .black
        $0.font = Font.errorLabel
    }
    let firstCategoryView = UIView().then {
        $0.setBorder(borderColor: .black, borderWidth: 1.5)
        $0.setRounded(radius: 12)
    }
    let secondCategoryLabel = UILabel().then {
        $0.text = "주육류"
        $0.textColor = .black
        $0.font = Font.errorLabel
    }
    let secondCategoryView = UIView().then {
        $0.setBorder(borderColor: .black, borderWidth: 1.5)
        $0.setRounded(radius: 12)
    }
    let thirdCategoryLabel = UILabel().then {
        $0.text = "주육류"
        $0.textColor = .black
        $0.font = Font.errorLabel
    }
    let thirdCategoryView = UIView().then {
        $0.setBorder(borderColor: .black, borderWidth: 1.5)
        $0.setRounded(radius: 12)
    }
    let reviewLabel = UILabel().then {
        $0.text = "총 리뷰"
        $0.font = Font.smallGuideLabel
        $0.textAlignment = .center
    }
    let reviewCountLabel = UILabel().then {
        $0.text = "34"
        $0.textAlignment = .center
        $0.font = Font.smallGuideLabel
    }

    let scoreLabel = UILabel().then {
        $0.text = "평균 총점"
        $0.textAlignment = .center
        $0.font = Font.smallGuideLabel
    }

    let scoreCountLabel = UILabel().then {
        $0.text = "4.5"
        $0.font = Font.smallGuideLabel
        $0.textAlignment = .center
    }

    let pleasureLabel = UILabel().then {
        $0.text = "평균 기호도"
        $0.font = Font.smallGuideLabel
        $0.textAlignment = .center
    }

    let pleasureCountLabel = UILabel().then {
        $0.text = "3.7"
        $0.font = Font.smallGuideLabel
        $0.textAlignment = .center
    }
    let reviewButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapReview), for: .touchUpInside)
    }
    let reviewLabelButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapReview), for: .touchUpInside)
        $0.setTitle("리뷰를 작성해주세요.", for: .normal)
        $0.setTitleColor(.putty, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    let reviewIMGButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapReview), for: .touchUpInside)
        $0.setImage(UIImage(named: "icEdit"), for: .normal)
    }
    let reviewGuideView = UIView().then {
        $0.backgroundColor = .whiteTwo
    }
    let reviewGuideLabel = UILabel().then {
        $0.text = "리뷰 전체보기"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    // MARK: - Variables and Properties
    lazy var rightButton = UIBarButtonItem.init(image: UIImage(named: "icInfoOutline24Px"),
                                                style: .done,
                                                target: self,
                                                action: #selector(didTapInfoButton))

    var foodIndex: Int?
    var isEdit: Bool = false
    var productInfo: CatProduct?
    var reviews: [Review]?

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        contraint()
        setNav()
        review(String(foodIndex ?? 0))
        navigationItem.rightBarButtonItem = rightButton
        dump(productInfo)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(#function)
    }



}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension ProductDetailVC {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    @objc func didTapInfoButton(){
        let url = URL(string: productInfo?.foodLink ?? "")
        let safariViewController = SFSafariViewController(url: url!)
        safariViewController.preferredControlTintColor = .black

        present(safariViewController, animated: true, completion: nil)

    }

    func setNav(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
    }

    func setTableView(){
        productTV.delegate = self
        productTV.dataSource = self
        productTV.separatorStyle = .none
        productTV.register(ProductDetailTVCell.self,
                           forCellReuseIdentifier: "ProductDetailTVCell")
    }

    @objc func didTapReview(){
        print(#function)
        let sb = UIStoryboard(name: "Post", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PostVC") as! PostVC
        vc.foodIndexNumber = productInfo?.foodIdx
        vc.foodDry = productInfo?.foodDry
        vc.foodMeat1 = productInfo?.foodMeat1
        vc.foodMeat2 = productInfo?.foodMeat2
        vc.imageNameVC = productInfo?.foodImg
        vc.companyNameVC = productInfo?.foodManu
        vc.productNameVC = productInfo?.foodName

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func review(){
        let currentProfile = KeychainWrapper.standard.string(forKey: "currentProfile")
        for i in 0 ..< (reviews?.count ?? 0) {
            print(reviews?[i].profileIdx ?? 0)
            
            if currentProfile == String(reviews?[i].profileIdx ?? 0) {
                reviewButton.isEnabled = false
                reviewLabelButton.isEnabled = false
                reviewIMGButton.isEnabled = false

                reviewLabelButton.setTitle("이미 리뷰를 작성했습니다.", for: .normal)
            }
        }

    }

}



extension ProductDetailVC: UITableViewDelegate { }
extension ProductDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTVCell",
                                                 for: indexPath) as! ProductDetailTVCell
        cell.backgroundColor = .whiteTwo
        cell.cellConstraint()
        cell.review = reviews?[indexPath.row]
        cell.cellService()
    
        cell.selectionStyle = .none
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        headerView.backgroundColor = .white

        headerView.addSubview(headerIMG)
        headerIMG.imageFromUrl(productInfo?.foodImg, defaultImgPath: "")
        headerView.addSubview(headerCompanyNameLabel)
        headerCompanyNameLabel.text = productInfo?.foodManu
        headerView.addSubview(headerProductNameLabel)
        headerProductNameLabel.text = productInfo?.foodName
        headerView.addSubview(firstCategoryLabel)
        firstCategoryLabel.text = productInfo?.foodDry
        headerView.addSubview(firstCategoryView)
        headerView.addSubview(secondCategoryLabel)
        secondCategoryLabel.text = productInfo?.foodMeat1
        headerView.addSubview(secondCategoryView)
        if productInfo?.foodMeat2 == "" || productInfo?.foodMeat2 == nil {
            thirdCategoryLabel.alpha = 0
            thirdCategoryView.alpha = 0
        } else {
            thirdCategoryLabel.text = productInfo?.foodMeat2
        }
        headerView.addSubview(thirdCategoryLabel)
        headerView.addSubview(thirdCategoryView)
        headerView.addSubview(reviewLabel)
//        reviewLabel.text = productInfo?.reviewInfo
        headerView.addSubview(reviewCountLabel)
        reviewCountLabel.text = String(productInfo?.reviewCount ?? 0)
        headerView.addSubview(scoreLabel)
        headerView.addSubview(scoreCountLabel)
        scoreCountLabel.text = String(productInfo?.avgRating ?? 0)
        headerView.addSubview(pleasureLabel)
        headerView.addSubview(pleasureCountLabel)
        pleasureCountLabel.text = String(productInfo?.avgPrefer ?? 0)
        headerView.addSubview(reviewButton)
        headerView.addSubview(reviewLabelButton)
        headerView.addSubview(reviewIMGButton)
        headerView.addSubview(reviewGuideView)
        headerView.addSubview(reviewGuideLabel)

        headerIMG.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.top).offset(22)
            make.leading.equalTo(headerView.snp.leading).offset(51)
            make.bottom.equalTo(headerView.snp.top).offset(111)
            make.trailing.equalTo(headerView.snp.leading).offset(140)
        }

        headerCompanyNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(28)
            make.leading.equalTo(headerIMG.snp.trailing).offset(20)
        }

        headerProductNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerCompanyNameLabel.snp.bottom).offset(3)
            make.leading.equalTo(headerCompanyNameLabel.snp.leading)
            make.height.equalTo(24)
        }

        firstCategoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstCategoryView.snp.top).offset(3)
            make.leading.equalTo(firstCategoryView.snp.leading).offset(10.5)
            make.height.equalTo(18)
        }

      firstCategoryView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.top).offset(79)
            make.leading.equalTo(headerIMG.snp.trailing).offset(20)
            make.trailing.equalTo(firstCategoryLabel.snp.trailing).offset(10.5)
            make.height.equalTo(25)
        }

        secondCategoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(secondCategoryView.snp.top).offset(3)
            make.leading.equalTo(secondCategoryView.snp.leading).offset(10.5)
            make.height.equalTo(18)
        }

        secondCategoryView.snp.makeConstraints { (make) in
            make.top.equalTo(firstCategoryView)
            make.leading.equalTo(firstCategoryView.snp.trailing).offset(5)
            make.trailing.equalTo(secondCategoryLabel.snp.trailing).offset(10.5)
            make.height.equalTo(25)
        }

        thirdCategoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(thirdCategoryView.snp.top).offset(3)
            make.leading.equalTo(thirdCategoryView.snp.leading).offset(10.5)
            make.height.equalTo(18)
        }

        thirdCategoryView.snp.makeConstraints { (make) in
            make.top.equalTo(firstCategoryView)
            make.leading.equalTo(secondCategoryView.snp.trailing).offset(5)
            make.trailing.equalTo(thirdCategoryLabel.snp.trailing).offset(10.5)
            make.height.equalTo(25)
        }

        reviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scoreLabel)
            make.trailing.equalTo(scoreLabel.snp.leading)
            make.width.equalTo(view.frame.width/4)
            make.height.equalTo(19)
        }

        reviewCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(reviewLabel.snp.bottom).offset(4)
            make.trailing.equalTo(scoreLabel.snp.leading)
            make.width.equalTo(view.frame.width/4)
        }

        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerIMG.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width/3)
            make.height.equalTo(19)
        }
        scoreCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(reviewCountLabel)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width/3)
        }
        pleasureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scoreLabel)
            make.leading.equalTo(scoreCountLabel.snp.trailing)
            make.width.equalTo(view.frame.width/4)
            make.height.equalTo(19)
        }
        pleasureCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(reviewCountLabel)
            make.leading.equalTo(scoreCountLabel.snp.trailing)
            make.width.equalTo(view.frame.width/4)
        }
        reviewButton.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(181)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(67)
        }
        reviewLabelButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(reviewButton.snp.centerY)
            make.leading.equalTo(34)
        }

        reviewIMGButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(reviewButton.snp.centerY)
            make.trailing.equalToSuperview().offset(-36)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

        reviewGuideView.snp.makeConstraints { (make) in
            make.bottom.equalTo(headerView)
            make.height.equalTo(52)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        reviewGuideLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(17)
            make.top.equalTo(reviewGuideView.snp.top).offset(14)
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Post", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PostVC") as! PostVC
        vc.reviews = reviews?[indexPath.row]
        vc.reviewIdx = reviews?[indexPath.row].reviewIdx
        vc.isOther = true
        vc.isEdit = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // 로딩된 cell 중 마지막 셀 찾기
//        let lastSectionIndex = tableView.numberOfSections - 1
//        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
//        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
//
//            let spinner = UIActivityIndicatorView()
//
//            productTV.tableFooterView = spinner
//            productTV.tableFooterView?.isHidden = false
//
//            if reviews?.count != 0 && reviews?.count != nil {
//                // 불러올 포스팅이 있을 경우
//                spinner.startAnimating()
//                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: productTV.bounds.width, height: CGFloat(44))
//                spinner.hidesWhenStopped = true
//                productTV.tableFooterView = spinner
//                productTV.tableFooterView?.isHidden = false
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    self.review(String(self.foodIndex ?? 0))
//                }
//            } else {
//                self.productTV.tableFooterView?.isHidden = true
//                spinner.stopAnimating()
//            }
//
//
//        }
//    }

}

extension ProductDetailVC {
//    func loadMorePosts(_ productIndex: String) {
//        if newsPosts?.count != 0 {
//            getNewsPostsService(postCnt: 10, lastId: lastId, completionHandler: {(returnedData)-> Void in
//                self.newsPostsArr?.append(contentsOf: self.newsPosts!)
//                self.newsTV.reloadData()
//                self.newsTV.tableFooterView = nil
//            })
//        } else {
//            print("더 이상 불러올 게시글이 없습니다.")
//        }
//    }

    func review(_ productIndex: String) {
        ReviewService.shared.productReview(productIndex) { responsedata in
            switch responsedata {
            case .success(let res):
                self.reviews = res as? [Review]
                self.review()
                self.productTV.reloadData()
                
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
