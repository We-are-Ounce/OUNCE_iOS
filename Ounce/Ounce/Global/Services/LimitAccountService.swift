//
//  LimitAccountService.swift
//  Ounce
//
//  Created by psychehose on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct LimitAccountService {
    
    private init() {}
    
    static let shared = LimitAccountService()
    
    func testTap(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        print(#function)
        
        let URL = APIConstants.limitAddAccount
        print (URL)
        
        let profile = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        let token = KeychainWrapper.standard.string(forKey: "Token") ?? ""
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token
        ]
        
        
        
        Alamofire.request(URL, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData{
            response in
            
            print("오우예")
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseSimpleResult<LimitAccount>.self, from: value)
                                completion(.success(result.data ?? ""))
                                print("성공")
                            } catch {
                                completion(.pathErr)
                                print("실패")
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

