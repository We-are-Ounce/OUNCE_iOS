//
//  ResponseResult.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/13.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var data: [T]?
}

struct ResponseSimpleResult<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var data: T?
}

struct ResponseTempResult: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
}
