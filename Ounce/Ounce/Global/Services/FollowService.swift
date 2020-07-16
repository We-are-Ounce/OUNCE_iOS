//
//  FollowService.swift
//  Ounce
//
//  Created by psychehose on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

struct FollowService {
    
    private init() {}
    
    static let shared = FollowService()
    
    func didTapFollow(){
        
    }
    
    //MARK - 팔로워
    
    func follower(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.followerList + "/4?pageStart=1&pageEnd=10"
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData{
            response in
            
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseResult<Follow>.self, from: value)
                                completion(.success(result.data ?? Follow.self))
                            } catch {
                                completion(.pathErr)
                                print("여기")
                            }
                        case 409:
                            completion(.pathErr)
                            print("저기")
                        case 500:
                            completion(.serverErr)
                            print("여기저기")
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
    
    
    func following(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.followingList + "/2?pageStart=1&pageEnd=10"
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData{
            response in
            
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseResult<Follow>.self, from: value)
                                completion(.success(result.data ?? Follow.self))
                            } catch {
                                completion(.pathErr)
                                print("여기")
                            }
                        case 409:
                            completion(.pathErr)
                            print("저기")
                        case 500:
                            completion(.serverErr)
                            print("여기저기")
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
