//
//  SearchService.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/14.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct SearchService {
    private init() {}
    
    static let shared = SearchService()
    
    // MARK: - 유저 검색
    
    func searchUser(_ userId: String,
                    completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.searchUser
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        print(URL)
        let body : Parameters = [
            "userId": userId
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
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
                                let result = try decoder.decode(ResponseResult<User>.self,
                                                                from: value)
                                completion(.success(result.data ?? [User].self))
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
    
    
    // MARK: - 제품 검색
    
    func searchProduct(_ userId: String,
                       completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.searchUser
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        print(URL)
        let body : Parameters = [
            "userId": userId
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
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
                                let result = try decoder.decode(ResponseResult<User>.self,
                                                                from: value)
                                completion(.success(result.data ?? [User].self))
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
