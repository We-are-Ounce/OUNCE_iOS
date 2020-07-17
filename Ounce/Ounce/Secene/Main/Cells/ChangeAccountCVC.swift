//
//  ChangeAccountCVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ChangeAccountCVC: UICollectionViewCell {

    static let identifier: String = "ChangeAccountCVC"
    
    var accountInfo: OtherAccount?
    
    let anotherCatImg = UIImageView().then {
        $0.backgroundColor = .pale
        $0.setRounded(radius: 27)
    }
    
    let catNameLabel = UILabel().then {
        $0.text = "현재 고양이 이름"
        $0.sizeToFit()
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
    }
    let oneIntroductionLabel = UILabel().then {
        $0.text = "나의 고양이 한줄 소개"
        $0.sizeToFit()
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }

    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
    // MARK - 여기에다가 함수 만들어서 인덱스패스를 이용해서 호출
//    func testFunc(){
//
//    }
    
    
    
    // 정보를 로드 하고 그 다음에 함수를 실행한다?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(anotherCatImg)
        self.addSubview(catNameLabel)
        self.addSubview(oneIntroductionLabel)
        
        anotherCatImg.snp.makeConstraints { ( make ) in
            
            make.height.equalTo(54)
            make.width.equalTo(54)
            make.leading.equalTo(contentView.snp.leading).inset(28)
            make.top.equalTo(contentView.snp.top).inset(12)
        }
        catNameLabel.snp.makeConstraints { ( make ) in
            
            make.height.equalTo(24)
            //make.width.equalTo(29)
            make.top.equalTo(contentView.snp.top).inset(18)
            make.leading.equalTo(anotherCatImg.snp.trailing).inset(-12)
        }
        
        oneIntroductionLabel.snp.makeConstraints{ ( make ) in
            
            make.height.equalTo(18)
            make.top.equalTo(catNameLabel.snp.bottom).inset(-5)
            make.leading.equalTo(anotherCatImg.snp.trailing).inset(-12)
        }
        
    }
    
    func setCall() {
        
        anotherCatImg.imageFromUrl(accountInfo?.profileImg ?? "", defaultImgPath: accountInfo?.profileImg ?? "")
        catNameLabel.text = accountInfo?.profileName
        oneIntroductionLabel.text = accountInfo?.profileInfo
        
        
    }
    
    
    
}
