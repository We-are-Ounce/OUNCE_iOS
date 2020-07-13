//
//  SoicialList.swift
//  Ounce
//
//  Created by psychehose on 2020/07/11.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct Follow: Codable {
    let profileIdx: Int
    let profileImg, profileName: String
    let profileWeight: Double
    let profileGender: String
    let profileAge: Int
}
