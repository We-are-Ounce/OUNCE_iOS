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
                    _ pageStart: Int,
                    _ pageEnd: Int,
                    completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.searchUser
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body : Parameters = [
            "userId": userId,
            "pageStart": pageStart,
            "pageEnd": pageEnd
            
        ]
        
        Alamofire.request(URL,
                          method: .post,
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
                                    let result = try decoder.decode(ResponseResult<User>.self,
                                                                    from: value)
                                    print(result)
                                    completion(.success(result.data ?? [User].self))
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
    
    
    // MARK: - 제품 검색
    
    func searchProduct(_ searchKeyword: String,
                       _ pageStart: Int,
                       _ pageEnd: Int,
                       completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.searchProduct
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        print(URL)
        let body : Parameters = [
            "searchKeyword": searchKeyword,
            "pageStart": pageStart,
            "pageEnd": pageEnd
        ]
        
        dump(body)
        
        Alamofire.request(URL,
                          method: .post,
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
                                    let result = try decoder.decode(ResponseResult<CatProduct>.self,
                                                                    from: value)
                                    completion(.success(result.data ?? [CatProduct].self))
                                } catch {
                                    completion(.pathErr)
                                }
                            case 400:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseTempResult.self,
                                                                    from: value)
                                    completion(.success(result))
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
    
     // MARK: - 기록을 위한 검색. 사용자가 남긴 리뷰에 해당하는 제품을 걸러내는 API
    func searchToWrite(_ profileIdx: Int, _ searchKeyword: String,
                       _ pageStart: Int,
                       _ pageEnd: Int,
                       completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.searchToWrite + "/\(profileIdx)" // profileidx값 어케 받져
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        print(URL)
        let body : Parameters = [
            "searchKeyword": searchKeyword,
            "pageStart": pageStart,
            "pageEnd": pageEnd
        ]
        
        dump(body)
        
        Alamofire.request(URL,
                          method: .post,
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
                                    let result = try decoder.decode(ResponseResult<FilteredCatProduct>.self,
                                                                    from: value)
                                    completion(.success(result.data ?? [FilteredCatProduct].self))
                                } catch {
                                    completion(.pathErr)
                                    print("??")
                                }
                            case 400:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseTempResult.self,
                                                                    from: value)
                                    completion(.success(result))
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
