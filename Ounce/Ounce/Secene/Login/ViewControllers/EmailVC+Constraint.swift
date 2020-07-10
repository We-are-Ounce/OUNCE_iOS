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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.view.addSubview(guideLabel)
        self.view.addSubview(emailGuideLabel)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailUnderBarView)
        self.view.addSubview(emailErrorGuiedLabel)
        self.view.addSubview(emailCertificationButton)
        self.view.addSubview(certificationGuideLabel)
        self.view.addSubview(certificationTextField)
        self.view.addSubview(certificationUnderBarView)
        self.view.addSubview(certificationErrorGuideLabel)
        self.view.addSubview(certificationButton)

        guideLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(88)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(80)
        }
        
        emailGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(guideLabel.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(24)
        }

        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailGuideLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalTo(emailUnderBarView.snp.trailing).offset(-10)
            make.height.equalTo(24)
        }
        
        emailUnderBarView.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(emailCertificationButton.snp.leading).offset(-10)
            make.height.equalTo(1)
        }
        
        emailErrorGuiedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailUnderBarView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(22)
            make.width.equalTo(210)
            make.height.equalTo(18)
        }
        
        emailCertificationButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(238)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(55)
            make.height.equalTo(31)
        }

        certificationGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailErrorGuiedLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        
        certificationTextField.snp.makeConstraints { (make) in
            make.top.equalTo(certificationGuideLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalTo(certificationUnderBarView.snp.trailing).offset(-5)
            make.height.equalTo(24)
        }
        
        certificationUnderBarView.snp.makeConstraints { (make) in
            make.top.equalTo(certificationTextField.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(certificationButton.snp.leading).offset(-10)
            make.height.equalTo(1)
        }

        certificationErrorGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(certificationUnderBarView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(210)
            make.height.equalTo(71)
        }
        
        certificationButton.snp.makeConstraints { (make) in
            make.top.equalTo(emailCertificationButton.snp.bottom).offset(56)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(55)
            make.height.equalTo(31)
        }
        
    }
}
