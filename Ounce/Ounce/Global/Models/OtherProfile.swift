//
//  OtherProfile.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct OtherProfile: Codable {
    let reviewCountAll: Int
    let profileInfoArray: [ProfileInfoArray]
    let ischeck: Bool
}
