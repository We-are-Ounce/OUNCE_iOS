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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        foodIdx = (try? values.decode(Int.self, forKey: .foodIdx)) ?? 0
        foodMeat = (try? values.decode(String.self, forKey: .foodMeat)) ?? ""
        foodDry = (try? values.decode(Int.self, forKey: .foodDry)) ?? 0
        foodImg = (try? values.decode(String.self, forKey: .foodImg)) ?? ""
        foodManu = (try? values.decode(String.self, forKey: .foodManu)) ?? ""
        foodName = (try? values.decode(String.self, forKey: .foodName)) ?? ""
        foodLink = (try? values.decode(String.self, forKey: .foodLink)) ?? ""
        reviewCount = (try? values.decode(Int.self, forKey: .reviewCount)) ?? 0
        reviewIdx = (try? values.decode(Int.self, forKey: .reviewIdx)) ?? 0
        reviewInfo = (try? values.decode(String.self, forKey: .reviewInfo)) ?? ""
        avgRating = (try? values.decode(Int.self, forKey: .avgRating)) ?? 0
        avgPrefer = (try? values.decode(Int.self, forKey: .avgPrefer)) ?? 0
    }

}
