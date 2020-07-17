//
//  ReviewTotal.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

// MARK: - 리뷰 총점순 정렬
struct ReviewTotal: Codable {
    
    let reviewIdx, profileIdx, foodIdx: Int
    let foodImg: String
    let foodManu, foodName, foodInfo: String
    let foodRating, foodPrefer: Int
    let createdAt: String
    
}
