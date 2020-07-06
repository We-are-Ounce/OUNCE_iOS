//
//  BrowseVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/05.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class BrowseVC: UIViewController{
    
    var collectionView: UICollectionView?
    
    fileprivate var currentPage: Int = 0
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView?.collectionViewLayout as! UpCarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    let nameLabel = UILabel().then {
        $0.text = "test label"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
    }
    
    let nameLabel2 = UILabel().then {
        $0.text = "와"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
    }
    
    let nameLabel3 = UILabel().then {
        $0.text = "입맛이 비슷해요"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        
    }
    
    
    var colors : [UIColor] = [.white, .white, .white, .white, .white]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCollectionView()
        self.setupLayout()
        self.setlayout()
        
        self.collectionView?.showsHorizontalScrollIndicator = false
    }
    
    func setlayout(){
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameLabel2)
        self.view.addSubview(nameLabel3)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(88)
            make.width.equalToSuperview()
            make.height.equalTo(27.5)
        }
        
    }
    
    
    
    
    func setupLayout(){
        // This is just an utility custom class to calculate screen points
        // to the screen based in a reference view. You can ignore this and write the points manually where is required.
        
        
        let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.view.frame.size)

        self.collectionView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.collectionView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: pointEstimator.relativeHeight(multiplier: 0.1754)).isActive = true
        self.collectionView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.collectionView?.heightAnchor.constraint(equalToConstant: pointEstimator.relativeHeight(multiplier: 0.6887)).isActive = true
        
        self.currentPage = 0
    }
    
    //0.1754
    //0.6887
    
    
    
    func addCollectionView(){

        // This is just an utility custom class to calculate screen points
        // to the screen based in a reference view. You can ignore this and write the points manually where is required.
        let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.view.frame.size)

        // This is where the magic is done. With the flow layout the views are set to make costum movements. See https://github.com/ink-spot/UPCarouselFlowLayout for more info
        let layout = UpCarouselFlowLayout()
        // This is used for setting the cell size (size of each view in this case)
        // Here I'm writting 400 points of height and the 73.33% of the height view frame in points.
        layout.itemSize = CGSize(width: pointEstimator.relativeWidth(multiplier: 0.73333), height: 400)
        // Setting the scroll direction
        layout.scrollDirection = .horizontal

        // Collection view initialization, the collectionView must be
        // initialized with a layout object.
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // This line if for able programmatic constrains.
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        // CollectionView delegates and dataSource:
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        // Registering the class for the collection view cells
        self.collectionView?.register(BrowseCVCell.self, forCellWithReuseIdentifier: "cellId")

        // Spacing between cells:
        let spacingLayout = self.collectionView?.collectionViewLayout as! UpCarouselFlowLayout
        spacingLayout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 20)

        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView!)

    }

    // MARK: - Card Collection Delegate & DataSource

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

    // MARK: - UIScrollViewDelegate

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView?.collectionViewLayout as! UpCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
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


extension BrowseVC: UICollectionViewDelegate { }

extension BrowseVC: UICollectionViewDataSource {
    
}

