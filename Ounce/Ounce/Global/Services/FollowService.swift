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
    
    func didTapFollow(_ followerProfileIndex: Int,
                      completion: @escaping (NetworkResult<Any>) -> Void) {
        
        print(#function)
        
        let URL = APIConstants.follow
        print(URL)
        let profile = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        let token = KeychainWrapper.standard.string(forKey: "Token") ?? ""
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token
        ]
        
        let body : Parameters = [
            "myprofileIdx" : profile,
            "followingIdx" : followerProfileIndex
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData{
            response in
            print("시작")
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseTempResult.self, from: value)
                                completion(.success(result.message ?? ""))
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
    
    func didTapUnfollow(_ followerProfileIndex: Int,
                        completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.deleteFollow
        let profile = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        let token = KeychainWrapper.standard.string(forKey: "Token") ?? ""
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token
        ]
        
        let body : Parameters = [
            "myprofileIdx" : profile,
            "followingIdx" : followerProfileIndex
        ]
        
        Alamofire.request(URL,
                          method: .delete,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData{
            response in
            print("시작")
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseTempResult.self, from: value)
                                completion(.success(result.message ?? ""))
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
    //MARK - 팔로워
    
    func follower(_ profileIndex: String,
                  _ pageStart: Int,
                  _ pageEnd: Int,
                  completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.followerList + "/" + profileIndex + "?pageStart=" + String(pageStart) + "&pageEnd=" + String(pageEnd)
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json"
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
    
    
    func following(_ profileIndex: String,
                   _ pageStart: Int,
                   _ pageEnd: Int,
                   completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.followingList + "/" + profileIndex + "?pageStart=" + String(pageStart) + "&pageEnd=" + String(pageEnd)
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json"
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
                                dump(result)
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
