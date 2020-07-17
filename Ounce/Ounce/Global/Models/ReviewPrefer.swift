//
//  ReviewPrefer.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/18.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

// MARK: - 리뷰 기호도 정렬
struct ReviewPrefer: Codable {
    let reviewIdx, profileIdx: Int
    let foodImg: String
    let foodManu, foodName, reviewInfo, reviewRating: String
    let reviewPrefer, createdAt: String
}

