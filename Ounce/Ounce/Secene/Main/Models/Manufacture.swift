//
//  Manufacture.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import UIKit

// Model struct파일은 데이터 통신 전에 클라에서 임의로 데이터를 넣을 때
// 서버 통신 시 필요없음

struct Manufacture{

    var manufactureBtn: String

    init(manufactureBtn: String){

        self.manufactureBtn = manufactureBtn
        
    }
}
