//
//  ReviewData.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

// MARK: - ReviewData
struct ReviewData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Int
}
