//
//  SignIn.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/13.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct SignIn: Codable {
    let accessToken: String
    let profileIdx, profileCount: Int
}
