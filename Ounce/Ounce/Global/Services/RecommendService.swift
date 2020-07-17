//
//  Recommand.swift
//  Ounce
//
//  Created by psychehose on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct RecommendService {
    private init() {}
    
    static let shared = RecommendService()
    
    func recommendCat(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.recommend
        let currentProfile = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        
        let body: Parameters = [
            "profileIdx": currentProfile
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData{
            response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        //print(status)
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseSimpleResult<Recommend>.self, from: value)
                                completion(.success(result.data ?? Recommend.self))
                                dump(result.data?.resultProfile)
                            }catch {
                                completion(.pathErr)
                                print("저기야?")
                            }
                        case 409:
                            completion(.pathErr)
                            print("살려줘")
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }
                    }
                }
                break
            case.failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
}
