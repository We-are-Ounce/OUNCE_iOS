//
//  ProductDetailVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/12.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import Then
import SnapKit

class ProductDetailVC: UIViewController {
    
    // MARK: - UI components
    
    let productTV = UITableView(frame: CGRect.init(), style: .grouped).then{
        $0.backgroundView?.backgroundColor = .white
    }
    
    let headerView = UIView()
    
    let headerIMG = UIImageView().then {
        $0.backgroundColor = .pale
        $0.setRounded(radius: 8)
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
    lazy var rightButton = UIBarButtonItem.init(image: UIImage(named: "icMore"), style: .done, target: self, action: nil)

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        contraint()
        navigationItem.rightBarButtonItem = rightButton

    }
    
}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension ProductDetailVC {
    func setNav(){
//        navigationController?.isNavigationBarHidden = false
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
    }
}

extension ProductDetailVC: UITableViewDelegate { }
extension ProductDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTVCell",
                                                 for: indexPath) as! ProductDetailTVCell
        cell.backgroundColor = .whiteTwo
        cell.cellConstraint()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.backgroundColor = .white
        headerView.addSubview(headerIMG)
        headerView.addSubview(headerCompanyNameLabel)
        headerView.addSubview(headerProductNameLabel)
        headerView.addSubview(firstCategoryLabel)
        headerView.addSubview(firstCategoryView)
        headerView.addSubview(secondCategoryLabel)
        headerView.addSubview(secondCategoryView)
        headerView.addSubview(thirdCategoryLabel)
        headerView.addSubview(thirdCategoryView)
        headerView.addSubview(reviewLabel)
        headerView.addSubview(reviewCountLabel)
        headerView.addSubview(scoreLabel)
        headerView.addSubview(scoreCountLabel)
        headerView.addSubview(pleasureLabel)
        headerView.addSubview(pleasureCountLabel)
        headerView.addSubview(reviewButton)
        headerView.addSubview(reviewLabelButton)
        headerView.addSubview(reviewIMGButton)
        headerView.addSubview(reviewGuideView)
        headerView.addSubview(reviewGuideLabel)
        
        headerIMG.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.top).offset(22)
            make.leading.equalTo(headerView.snp.leading).offset(51)
            make.width.equalTo(89)
            make.height.equalTo(89)
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
}
