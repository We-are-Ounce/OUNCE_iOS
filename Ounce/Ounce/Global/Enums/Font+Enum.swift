//
//  Font+Enum.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/01.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

enum Font {
//    static let nameLabel = UIFont(name: "NotoSansKR-Regular", size: 16)
    static let nameLabel = UIFont.systemFont(ofSize: 16)
//    static let guideLabel = UIFont(name: "NotoSansKR-Medium", size: 16)
    static let guideLabel = UIFont.systemFont(ofSize: 16)
//    static let smallGuideLabel = UIFont(name: "NotoSansKR-Regular", size: 13)
    static let smallGuideLabel = UIFont.systemFont(ofSize: 13)
//    static let smallButtonLabel = UIFont(name: "NotoSansKR-Bold", size: 13)
    static let smallButtonLabel = UIFont.boldSystemFont(ofSize: 13)
//    static let textField = UIFont(name: "NotoSansKR-Medium", size: 16)
    static let textField = UIFont.systemFont(ofSize: 16)
    static let dateLabel = UIFont.systemFont(ofSize: 16)

    
    // 회원가입
    static let signUpBigGuideLabel = UIFont.boldSystemFont(ofSize: 24)
    static let signUpSmallGuideLabel = UIFont.systemFont(ofSize: 24)
    static let errorLabel = UIFont.systemFont(ofSize: 12)
    static let buttonLabel = UIFont.systemFont(ofSize: 14)
}
