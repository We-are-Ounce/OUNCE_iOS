//
//  MyProfile.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/15.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

// MARK: - MyProfile
struct MyProfile: Codable {
    let reviewCountAll: Int
    let profileInfoArray: [ProfileInfoArray]
}

// MARK: - ProfileInfoArray
struct ProfileInfoArray: Codable {
    let profileImg: String
    let profileName, profileGender, profileNeutral: String
    let profileAge: Int
    let profileWeight, profileInfo: String
    let follower, following: Int
}
