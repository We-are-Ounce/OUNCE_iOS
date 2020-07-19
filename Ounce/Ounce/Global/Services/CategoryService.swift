//
//  CategoryService.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/18.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct CategoryService {
    private init() {}
    
    static let shared = CategoryService()
    
    func category(completion: @escaping (NetworkResult<Any>) -> Void){
        
        let profileIndex = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        
        let URL = APIConstants.reviewCategory + String(profileIndex) + "/category"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(URL,
                          method: .get,
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
                                                let result = try decoder.decode(ResponseResult<Category>.self,
                                                                                from: value)
                                                completion(.success(result.data ?? [Category].self))
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

struct Category: Codable {
    let foodManu: String
}
