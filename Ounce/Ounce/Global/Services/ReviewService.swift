//
//  ReviewService.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct ReviewService{
    
    static let shared = ReviewService()
    // Request body에 들어가는 내용
    private func makeParameter(_ reviewRating: Int,
                               _ reviewPrefer: Int,
                               _ reviewInfo: String,
                               _ reviewMemo: String,
                               _ reviewStatus: Int,
                               _ reviewSmell: Int,
                               _ reviewEye: Int,
                               _ reviewEar: Int,
                               _ reviewHair: Int,
                               _ reviewVomit: Int,
                               //_ createdAt: String,
                               _ foodIdx: Int,
                               _ profileIdx: Int) -> Parameters {
        return ["reviewRating":reviewRating,
                "reviewPrefer":reviewPrefer,
                "reviewInfo":reviewInfo,
                "reviewMemo":reviewMemo,
                "reviewStatus":reviewStatus,
                "reviewSmell": reviewSmell,
                "reviewEye": reviewEye,
                "reviewEar": reviewEar,
                "reviewVomit": reviewVomit,
                //"createdAt": createdAt,
                "foodIdx": foodIdx,
                "profileIdx": profileIdx]
    }
    
    func Review(_ reviewRating: Int,
                _ reviewPrefer: Int,
                _ reviewInfo: String,
                _ reviewMemo: String,
                _ reviewStatus: Int,
                _ reviewSmell: Int,
                _ reviewEye: Int,
                _ reviewEar: Int,
                _ reviewHair: Int,
                _ reviewVomit: Int,
                //_ createdAt: String,
                _ foodIdx: Int,
                _ profileIdx: Int,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        let token = KeychainWrapper.standard.string(forKey: "Token")

        let header: HTTPHeaders = ["Content-Type": "application/json", "token": token ?? ""]
        
        let body: Parameters = ["reviewRating":reviewRating,
        "reviewPrefer":reviewPrefer,
        "reviewInfo":reviewInfo,
        "reviewMemo":reviewMemo,
        "reviewStatus":reviewStatus,
        "reviewSmell": reviewSmell,
        "reviewEye": reviewEye,
        "reviewEar": reviewEar,
        "reviewVomit": reviewVomit,
        //"createdAt": createdAt,
        "foodIdx": foodIdx,
        "profileIdx": profileIdx]
        let dataRequest = Alamofire.request(APIConstants.addReview,
                                            method: .post,
                                            parameters: body,
                                            encoding: JSONEncoding.default,
                                            headers: header)
        
        // 데이터 통신 시작
        dataRequest.responseData { dataResponse in
            print("집 갈래",reviewRating, reviewPrefer, reviewInfo,reviewMemo,reviewStatus, reviewSmell,reviewEye,reviewEar,reviewHair,reviewVomit,/*createdAt,*/foodIdx,profileIdx)
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {
                    return
                }
                guard let value = dataResponse.result.value else { return }
                print(statusCode)
                switch statusCode {
                case 200:
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(ResponseSimpleResult<Int>.self, from: value)
                        completion(.success(result))
                        print("상태코드:\(statusCode)")
                    } catch {
                        print("123123")
                        completion(.pathErr)
                    }
                case 400:
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(ResponseSimpleResult<Int>.self, from: value)
                        print(result.message)
                        completion(.requestErr(result))
                    } catch {
                        print("400123123")
                        completion(.pathErr)
                    }

                default:
                    break
                }
//                dump(value, name: "value")
//                let networkResult = self.judge(by: statusCode, value)
//                dump(networkResult, name: "name")
//                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
//    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//         print(statusCode)
//        switch statusCode {
//
//        case 200: return isFilled(by: data)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//    private func isFilled(by data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(ReviewData.self, from: data) else { return .pathErr }
//        dump(decodedData, name: "decode")
////        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
//        return .success(decodedData)
//    }
    
}
