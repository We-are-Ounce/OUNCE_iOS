//
//  Recommand.swift
//  Ounce
//
//  Created by psychehose on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct Recommend: Codable {
    let resultProfile: [ResultProfile]
    let similarity: [Int]
    let recommendFoodList: [RecommendFoodList]
}
// MARK: - RecommendFoodList
struct RecommendFoodList: Codable {
    let foodImg: String
    let profileIdx: Int
}

// MARK: - ResultProfile
struct ResultProfile: Codable {
    let profileIdx: Int
    let profileImg: String
    let profileName: String
}
