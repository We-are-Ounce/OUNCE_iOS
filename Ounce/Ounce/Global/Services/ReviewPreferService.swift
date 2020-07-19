//
//  ReviewPreferService.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/18.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct ReviewPreferService {
    private init() {}
    
    static let shared = ReviewPreferService()
    
    // MARK: - 홈 뷰 리뷰 선호도 조회
    
    func preferReviews(_ profileIndex: String,
                      _ start: String,
                      _ end: String,
                      completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.reviewPrefer + profileIndex + "/prefer?pageStart=" + start + "&pageEnd=" + end
        
        let token = KeychainWrapper.standard.string(forKey: "Token")
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token ?? ""
        ]
        print("홈 뷰:기호도 프로필 인덱스\(URL)")
        Alamofire.request(URL,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData{
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
                                                let result = try decoder.decode(ResponseResult<ReviewPrefer>.self,
                                                                                from: value)
                                                completion(.success(result.data ?? [ReviewPrefer].self))
                                            } catch {
                                                completion(.pathErr)
                                            }
                                        case 400:
                                            do{
                                                let decoder = JSONDecoder()
                                                let result = try decoder.decode(ResponseTempResult.self,
                                                                                from: value)
                                                completion(.requestErr(result))
                                            } catch {
                                                completion(.pathErr)
                                            }
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
