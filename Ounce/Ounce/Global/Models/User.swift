//
//  User.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct User: Codable {
    let userIdx: Int
    let id: String
    let profileIdx: Int
    let profileImg: String
    let profileName, profileInfo: String
}
