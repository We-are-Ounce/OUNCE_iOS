//
//  ReviewUpdateService.swift
//  Ounce
//
//  Created by 이윤진 on 2020/07/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct ReviewUpdateService{
    
    private init() {}
    static let shared = ReviewUpdateService()
    
    var reviewIdx: Int?
    
    // MARK: - 리뷰 편집하기
    
    func updateReview( _ reviewIdx: Int,
                     _ reviewRating: Int,
                     _ reviewPrefer: Int,
                     _ reviewInfo:String,
                     _ reviewMemo: String,
                     _ reviewStatus: Int,
                     _ reviewSmell: Int,
                     _ reviewEye: Int,
                     _ reviewEar: Int,
                     _ reviewHair: Int,
                     _ reviewVomit: Int,
                     _ foodIdx: String,
                     _ profileIdx: String,
                     completion: @escaping (NetworkResult<Any>) -> Void){
        
        // profileidx 받아와줘야해
        
        let URL = APIConstants.updateReview + "/\(profileIdx)"
        let token = KeychainWrapper.standard.string(forKey: "Token")
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token ?? ""
        ]
        print(URL)
        
        let body : Parameters = [
            "reviewRating": reviewRating,
            "reviewPrefer": reviewPrefer,
            "reviewInfo": reviewInfo,
            "reviweMemo": reviewMemo,
            "reviewStatus": reviewStatus,
            "reviewSmell": reviewSmell,
            "reviewEye": reviewEye,
            "reviewEar": reviewEar,
            "reviewHair": reviewHair,
            "reviewVomit": reviewVomit,
            "foodIdx": foodIdx,
            "profileIdx": profileIdx
        ]
        
        dump(body)
        
        Alamofire.request(URL,
                          method: .put,
            parameters: body,
            encoding: JSONEncoding.default,
            headers: headers).responseData
            {
                response in
                
                switch response.result {
                    
                case .success:
                    // parameter 위치
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            print(status)
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseResult<AddReview>.self,
                                                                    from: value)
                                    
                                    completion(.success(result.data ?? [AddReview].self))
                                } catch {
                                    completion(.pathErr)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                }
        }
        
    }
    
        // MARK: - 리뷰 삭제하기
    
    
    func deleteReview(
                      _ profileIdx: Int,
                      _ reviewIdx: Int,
                      completion: @escaping (NetworkResult<Any>) -> Void){
        
        
        let URL = APIConstants.deleteReview + "/\(profileIdx)/\(reviewIdx)"
        let token = KeychainWrapper.standard.string(forKey: "Token")
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        print(URL)
        
    
        dump(body)
        
        Alamofire.request(URL,
                          method: .delete,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: headers).responseData
            {
                response in
                
                switch response.result {
                    
                case .success:
                    // parameter 위치
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            print(status)
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseResult<ResponseResult>.self,
                                                                    from: value)
                                    //                                    print(result)
                                    completion(.success(result.data ?? [ResponseResult].self))
                                } catch {
                                    completion(.pathErr)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                }
        }
        
    }
    
    
    
    
    
}



