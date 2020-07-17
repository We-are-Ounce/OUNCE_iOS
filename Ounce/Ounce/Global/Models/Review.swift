//
//  Review.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct Review: Codable {
    let profileIdx: Int
    let profileImg: String
    let profileName, reviewInfo: String
    let profileAge, reviewIdx: Int
    let reviewRating, reviewPrefer: String
    let foodIdx: Int
}



