//
//  UserService.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/13.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

struct UserService {
    private init() {}
    
    static let shared = UserService()
    
    // MARK: - 회원가입
    
    func signUp(_ email: String,
                _ id: String,
                _ password: String,
                completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.signUp
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        let body : Parameters = [
            "id": id,
            "password": password,
            "email": email
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
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseResult<String>.self, from: value)
                                completion(.success(result))
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
    
    
    // MARK: - 로그인
    
    func signIn(_ id: String,
                _ password: String,
                completion: @escaping (NetworkResult<Any>) -> Void){
        
        let URL = APIConstants.signIn
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        let body : Parameters = [
            "id": id,
            "password": password
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData{
            response in
            
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseSimpleResult<SignIn>.self, from: value)
                                completion(.success(result.data ?? SignIn.self))
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
    
    func sendEmail(_ email: String,
                   _ text: String,
                   completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.email
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        print(URL)
        let body : Parameters = [
            "email" : email,
            "myName" : "Ounce",
            "subject" : "이메일 인증",
            "text" : text
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
                if let _ = response.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            completion(.success("이메일 전송 성공"))
                        case 409:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default: break
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
