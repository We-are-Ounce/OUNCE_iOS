//
//  Password+Constraint.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit

extension PasswordVC {
    func constraint() {
        self.view.addSubview(guideLabel)
        self.view.addSubview(pwGuideLabel)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwUnderBarView)
        self.view.addSubview(pwErrorGuiedLabel)
        self.view.addSubview(firstPageControllView)
        self.view.addSubview(secondPageControllView)
        self.view.addSubview(thirdPageControllView)
        self.view.addSubview(nextButton)

        guideLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(80)
        }
        
        pwGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(guideLabel.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(24)
        }

        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwGuideLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(210)
            make.height.equalTo(24)
        }
        
        pwUnderBarView.snp.makeConstraints { (make) in
            make.top.equalTo(pwUnderBarView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(1)
        }
        
        pwErrorGuiedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pwUnderBarView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(210)
            make.height.equalTo(18)
        }
        
        firstPageControllView.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.trailing.equalTo(secondPageControllView.snp.leading).offset(-5)
            make.width.equalTo(31)
            make.height.equalTo(7)
        }
        
        secondPageControllView.snp.makeConstraints { (make) in
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
            make.centerX.equalToSuperview()
            make.width.equalTo(17)
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
            make.height.equalTo(71)
        }

    }

}
