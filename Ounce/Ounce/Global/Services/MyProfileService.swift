//
//  MyProfileService.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/15.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

// MARK: - 홈 뷰 프로필
struct MyProfileService {
    
    private init() {}
    
    static let shared = MyProfileService()
    
    func myProfile(_ profileIndex: String,
                   completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.catInfo + profileIndex
        
        let token = KeychainWrapper.standard.string(forKey: "Token")
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token ?? ""
        ]
        print(URL)
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
                                                let result = try decoder.decode(ResponseSimpleResult<MyProfile>.self,
                                                                                from: value)
                                                completion(.success(result.data ?? MyProfile.self))
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
    func otherProfile(_ profileIndex: String,
                      completion: @escaping (NetworkResult<Any>) -> Void){
        
        let my = KeychainWrapper.standard.integer(forKey: "currentProfile") ?? 0
        let URL = APIConstants.otherProfile + "?myprofileIdx=" + String(my) + "&profileIdx=" + profileIndex
        let token = KeychainWrapper.standard.string(forKey: "Token")
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token ?? ""
        ]
        print(URL)
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
                                                let result = try decoder.decode(ResponseSimpleResult<OtherProfile>.self,
                                                                                from: value)
                                                completion(.success(result.data ?? OtherProfile.self))
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

