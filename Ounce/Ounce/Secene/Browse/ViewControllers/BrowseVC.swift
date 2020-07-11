//
//  BrowseVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import CHIPageControl

import Then //추가 해야되는 지..


class BrowseVC: UIViewController {
    
    var collectionView: UICollectionView?
    
    fileprivate var currentPage: Int = 0
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView?.collectionViewLayout as! UpCarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    let searchField = UITextField().then {
        $0.text = ""
        $0.placeholder = "검색어를 입력해주세요."
        $0.textColor = .veryLightPinkFive
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
    }
    
    let searchView = UIView().then {
        
        $0.backgroundColor = .whiteThree
        $0.cornerRadius = 8
    }
    
    let searchImg = UIImageView().then {
        $0.image = UIImage(named: "icLook")
        $0.tintColor = .brownGreyColor
    }
    
    let guideNameLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.light)
        
        
        let attributedStr = NSMutableAttributedString(string: "")
    }
    
    // - MARK : Paging control
    
    let pageControl = CHIPageControlAji().then {
        $0.frame = .init(x: 0, y: 0, width: 100, height: 10)
        $0.numberOfPages = 5
        $0.radius = 4
        $0.tintColor = .veryLightPinkTwo
        $0.currentPageTintColor = .pinkishTan
        $0.padding = 6
    }
    
    var colors : [UIColor] = [.white, .white, .white, .white, .white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCollectionView()
        self.setupLayout()
        self.setupCollectionLayout()
        self.setNameLabel()
        //self.collectionView?.backgroundColor = .brownGreyColor
        self.collectionView?.showsHorizontalScrollIndicator = false
        searchField.delegate = self
    }
    
    func setupLayout(){
//        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = "둘러보기"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.view.addSubview(searchView)
        self.searchView.addSubview(searchField)
        self.searchView.addSubview(searchImg)
        self.view.addSubview(guideNameLabel)
        self.view.addSubview(pageControl)
        
        
        searchImg.snp.makeConstraints { (make) in
            make.leading.equalTo(searchView.snp.leading).inset(11)
            make.top.equalTo(searchView.snp.top).inset(13)
            make.width.equalTo(17.5)
            make.height.equalTo(17.5)
        }
        
        searchField.snp.makeConstraints{(make) in
            make.leading.equalTo(searchImg.snp.trailing).inset(-5)
            make.top.equalTo(searchView.snp.top).inset(12)
            make.bottom.equalTo(searchView.snp.bottom).inset(12)
            make.trailing.equalTo(searchView.snp.trailing).inset(5)
        }
        
        searchView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(17)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        
        guideNameLabel.snp.makeConstraints{( make ) in
            make.leading.equalToSuperview().inset(28)
            make.top.equalTo(searchView.snp.bottom).inset(-self.view.frame.height * 0.0874)
        }
        
        // MARK - indicator iPhone8 , SE2 에서 오토레이아웃 잡아 줄 것
        
        pageControl.snp.makeConstraints{( make ) in
            make.leading.equalToSuperview().inset(153)
            make.trailing.equalToSuperview().inset(153)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(50)
        }
        
        
        
        
    }
    
    // MARK: - collectiovView 조정
    
    func setupCollectionLayout(){
        
        //let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.view.frame.size)
        
        self.collectionView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.collectionView?.topAnchor.constraint(equalTo: self.guideNameLabel.bottomAnchor,
                                                  constant: self.view.frame.height * 0.065).isActive = true
        self.collectionView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.collectionView?.heightAnchor.constraint(equalToConstant: 273).isActive = true
        self.currentPage = 0
        
    }
    
    
    func postPositionText(_ name: String) -> String {
        guard let lastText = name.last else { return name }
        
        // 글자의 마지막 부분을 가져옴
        
        let unicodeVal = UnicodeScalar(String(lastText))?.value // 유니코드 전환
        
        guard let value = unicodeVal else { return name }
        
        if (value < 0xAC00 || value > 0xD7A3) { return name }   // 한글아니면 반환
        
        let last = (value - 0xAC00) % 28                        // 종성인지 확인
        
        let str = last > 0 ? "이와" : "와"      // 받침있으면 과 없으면 와 반환
        
        return name + str
        
    }
    
    
    // MARK - originCatName을 받고, postPositionText을 이용해서 조사를 붙여준다.
    
    func setNameLabel(){
        
        let origin_userCatName = "준현"
        
        let userCatName1 = postPositionText("호세")
        let userCatName2 = postPositionText("준현")
        let userCatName3 = postPositionText("준현이")
        
        
        
        let attributedStr = NSMutableAttributedString(string: userCatName2 + "\n입맛이 비슷해요.")
        
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                   value: UIFont.systemFont(ofSize: 24,weight: UIFont.Weight.medium) as Any, range: NSMakeRange(0, origin_userCatName.count))
        
        
        guideNameLabel.attributedText = attributedStr
        guideNameLabel.numberOfLines = 2
    }
    
    // MARK: - contentView size 조정
    
    func addCollectionView(){
        
        //        let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.view.frame.size)
        
        
        let layout = UpCarouselFlowLayout()
        
        layout.itemSize = CGSize(width: 219, height: 270)
        
        layout.scrollDirection = .horizontal
        
        
        // MARK: - Collection view initialization, the collectionView must be
        // MARK: - initialized with a layout object.
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // MARK: - This line if for able programmatic constrains.
        
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // MARK: - CollectionView delegates and dataSource:
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        // MARK: - Registering the class for the collection view cells
        
        self.collectionView?.register(BrowseCVCell.self, forCellWithReuseIdentifier: "cellId")
        
        // Spacing between cells:
        let spacingLayout = self.collectionView?.collectionViewLayout as! UpCarouselFlowLayout
        spacingLayout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 60)
        
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView!)
    }
    
}

class RelativeLayoutUtilityClass {
    
    var heightFrame: CGFloat?
    var widthFrame: CGFloat?
    
    init(referenceFrameSize: CGSize){
        heightFrame = referenceFrameSize.height
        widthFrame = referenceFrameSize.width
    }
    
    func relativeHeight(multiplier: CGFloat) -> CGFloat{
        
        return multiplier * self.heightFrame!
    }
    
    func relativeWidth(multiplier: CGFloat) -> CGFloat{
        return multiplier * self.widthFrame!
        
    }
    
    
}

extension BrowseVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let layout = self.collectionView?.collectionViewLayout as! UpCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        
        self.pageControl.set(progress: currentPage, animated: true)
    }
    
}

extension BrowseVC: UICollectionViewDelegate { }
extension BrowseVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! BrowseCVCell
        
        cell.customView.backgroundColor = colors[indexPath.row]
        return cell
    }
}

extension BrowseVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchField {
            view.endEditing(true)
            let sb = UIStoryboard(name: "Browse", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "BrowseSearchVC") as! BrowseSearchVC
            
            vc.navigationItem.backBarButtonItem?.title = ""
            
            self.navigationController?.pushViewController(vc,animated: true)
        }
    }
}
