//
//  String+Extension.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/03.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

extension String {
    // E-mail address validation
    public func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    public func validateOfficeEmail() -> Bool {
        let emailRegEx = "^.+@office+\\.skhu+\\.ac+\\.kr"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    public func validateSkhuKrEmail() -> Bool {
        let emailRegEx = "^.+@skhu+\\.kr"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }

    public func validateSkhuCoKrEmail() -> Bool {
        let emailRegEx = "^.+@skhu+\\.ac+\\.kr"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }

    
    // Password validation 영어 대문자 소문자 , 숫자 8자 이상
    public func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
    public func validateID() -> Bool {
        let passwordRegEx = "^([0-9a-zA-Z_-]+){1,2}$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }

    public func getDateFormat(time: String) -> Date? {
        let timeSplit = time.components(separatedBy: ["T", "."])
        let timeFormatted = timeSplit[0] + " " + timeSplit[1]
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YY-MM-dd HH:mm:ss"
        
        let timeDateFormat = dateFormat.date(from: timeFormatted)
        
        return timeDateFormat
    }
    
    public func stringByAddingPercentEncodingForFormData(plusForSpace: Bool=false) -> String? {
        let unreserved = "*-._"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        
        if plusForSpace {
            allowed.addCharacters(in: " ")
        }
        
        var encoded = addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
        if plusForSpace {
            encoded = encoded?.replacingOccurrences(of: " ", with: "+")
        }
        
        return encoded
    }
    
}
