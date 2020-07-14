//
//  Product.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct CatProduct: Codable {
    let foodIdx: Int
    let foodMeat: String
    let foodDry: Int
    let foodImg: String
    let foodManu, foodName: String
    let foodLink: String
    let reviewCount, reviewIdx: Int
    let reviewInfo: String
    let avgRating, avgPrefer: Int
}
