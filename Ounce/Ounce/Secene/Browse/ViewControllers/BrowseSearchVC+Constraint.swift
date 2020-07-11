//
//  BrowseSearchVC+Constraint.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SwiftKeychainWrapper
import SnapKit

extension BrowseSearchVC {
    func constraint() {
        view.addSubview(tabCV)
        view.addSubview(pageCV)
        view.addSubview(highlightView)
        view.addSubview(searchView)
        view.addSubview(searchButton)
        view.addSubview(searchTextField)
        view.addSubview(backButton)
        
        highlightView.backgroundColor = .signatureColor
        
        tabCV.delegate = self
        tabCV.dataSource = self
        pageCV.delegate = self
        pageCV.dataSource = self
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.height.equalTo(17.5)
            make.width.equalTo(17.5)
            make.top.equalTo(searchView.snp.top).offset(13)
            make.leading.equalTo(searchView.snp.leading).offset(11)
        }
        
        searchTextField.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.leading.equalTo(searchButton.snp.trailing).offset(8.5)
            make.trailing.equalTo(searchView.snp.trailing)
            make.top.equalTo(searchView.snp.top).offset(12)
        }
        
        tabCV.snp.makeConstraints { (make) in
            make.top.equalTo(searchView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(41)
        }
        
        pageCV.snp.makeConstraints { (make) in
            make.top.equalTo(tabCV.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
        highlightView.snp.makeConstraints { (make) in
            make.top.equalTo(tabCV.snp.bottom).offset(-3)
            make.width.equalTo(self.view.frame.width / 2)
            make.height.equalTo(3)
        }
    }
}
