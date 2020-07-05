//
//  EmailVC+Constraint.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//
import UIKit

import SnapKit

extension EmailVC {
    func constraint() {
        guideLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(71)
        }
        
        emailGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(guideLabel.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(24)
        }

        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(71)
        }
    }
}
