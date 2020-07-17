//
//  OtherACService.swift
//  Ounce
//
//  Created by psychehose on 2020/07/18.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct OtherACService {
    
    private init() {}
        
        static let shared = OtherACService()
        
    
    func loadOther(completion: @escaping (NetworkResult<Any>)-> Void) {
        
        
        
        let profile = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        
        let URL = APIConstants.convertProfile + "\(profile)"
        
        print(URL)
        
        let token = KeychainWrapper.standard.string(forKey: "Token") ?? ""
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token
            
        ]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData {
            response in
            
            print("통신 리퀘스트 시작~~~")
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            do {
                                print("여기가문제야")
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseResult<OtherAccount>.self, from: value)
                                print(result.message)
                                completion(.success(result.data ?? OtherAccount.self))
                                
                            } catch {
                                completion(.pathErr)
                            }
                        case 409:
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
    
