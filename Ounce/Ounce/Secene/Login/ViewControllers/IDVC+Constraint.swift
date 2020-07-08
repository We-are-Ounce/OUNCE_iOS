//
//  IDVC+Constraing.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit

extension IDVC {
    func constraint() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.view.addSubview(guideLabel)
        self.view.addSubview(idGuideLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(idUnderBarView)
        self.view.addSubview(idErrorGuiedLabel)
        self.view.addSubview(firstPageControllView)
        self.view.addSubview(secondPageControllView)
        self.view.addSubview(thirdPageControllView)
        self.view.addSubview(nextButton)

        guideLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(88)
            make.leading.equalToSuperview().offset(116)
            make.width.equalTo(210)
            make.height.equalTo(80)
        }
        
        idGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(guideLabel.snp.bottom).offset(45)
            make.leading.equalTo(guideLabel.snp.leading)
            make.width.equalTo(210)
            make.height.equalTo(24)
        }

        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idGuideLabel.snp.bottom).offset(8)
            make.leading.equalTo(guideLabel.snp.leading).offset(6)
            make.width.equalTo(210)
            make.height.equalTo(24)
        }
        
        idUnderBarView.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.bottom).offset(4)
            make.leading.equalTo(guideLabel.snp.leading)
            make.trailing.equalToSuperview().offset(86)
            make.height.equalTo(1)
        }
        
        idErrorGuiedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idErrorGuiedLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(210)
            make.height.equalTo(18)
        }
        
        firstPageControllView.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.trailing.equalTo(secondPageControllView.snp.leading).offset(-5)
            make.width.equalTo(17)
            make.height.equalTo(7)
        }
        
        secondPageControllView.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.centerX.equalToSuperview()
            make.width.equalTo(31)
            make.height.equalTo(7)
        }
        
        thirdPageControllView.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.leading.equalTo(secondPageControllView.snp.trailing).offset(5)
            make.width.equalTo(17)
            make.height.equalTo(7)
        }

        nextButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-13)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }

    }

}
