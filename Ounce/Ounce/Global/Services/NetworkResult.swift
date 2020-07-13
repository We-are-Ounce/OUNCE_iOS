//
//  NetworkResult.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/13.
//  Copyright © 2020 박주연. All rights reserved.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
