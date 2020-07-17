//
//  DetailReview.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct DetailReview: Codable {
    let foodIdx: Int
    let foodImg: String
    let foodManu, foodName, foodDry, foodMeat1: String
    let foodMeat2: String
    let createdAt, reviewRating, reviewPrefer, reviewInfo: String
    let reviewStatus, reviewSmell, reviewEye, reviewEar: Int
    let reviewHair, reviewVomit: Int
    let reviewMemo: String
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        foodIdx = (try? values.decode(Int.self, forKey: .foodIdx)) ?? 0
        foodMeat1 = (try? values.decode(String.self, forKey: .foodMeat1)) ?? ""
        foodMeat2 = (try? values.decode(String.self, forKey: .foodMeat2)) ?? ""
        foodDry = (try? values.decode(String.self, forKey: .foodDry)) ?? ""
        foodImg = (try? values.decode(String.self, forKey: .foodImg)) ?? ""
        foodManu = (try? values.decode(String.self, forKey: .foodManu)) ?? ""
        foodName = (try? values.decode(String.self, forKey: .foodName)) ?? ""
        createdAt = (try? values.decode(String.self, forKey: .createdAt)) ?? ""
        reviewRating = (try? values.decode(String.self, forKey: .reviewRating)) ?? ""
        reviewPrefer = (try? values.decode(String.self, forKey: .reviewPrefer)) ?? ""
        reviewInfo = (try? values.decode(String.self, forKey: .reviewInfo)) ?? ""
        reviewStatus = (try? values.decode(Int.self, forKey: .reviewStatus)) ?? 0
        reviewSmell = (try? values.decode(Int.self, forKey: .reviewSmell)) ?? 0
        reviewEye = (try? values.decode(Int.self, forKey: .reviewEye)) ?? 0
        reviewEar = (try? values.decode(Int.self, forKey: .reviewEar)) ?? 0
        reviewHair = (try? values.decode(Int.self, forKey: .reviewHair)) ?? 0
        reviewVomit = (try? values.decode(Int.self, forKey: .reviewVomit)) ?? 0
        reviewMemo = (try? values.decode(String.self, forKey: .reviewMemo)) ?? ""
        
    }
}



