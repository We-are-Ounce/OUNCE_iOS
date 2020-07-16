//
//  AddReview.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct AddReview: Codable{
    
    let reviewRating: Int
    let reviewPrefer: Int
    let reviewInfo:String
    let reviewMemo: String
    let reviewStatus: Int
    let reviewSmell: Int
    let reviewEye: Int
    let reviewEar: Int
    let reviewHair: Int
    let reviewVomit: Int
    let foodIdx: String
    let profileIdx: String
    
}
