//
//  UserReviews.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/15.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct UserReviews: Codable {
    
    let reviewIdx: Int
    let foodImg: String
    let foodManu, foodName, reviewInfo, reviewRating: String
    let reviewPrefer, createdAt: String
    
}
