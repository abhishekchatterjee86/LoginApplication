//
//  String.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import Foundation

extension String {
    
    //User name should be minimum 6 characters without spaces and special characters
    func isValidUsername() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z]{6,}").evaluate(with: self)
    }
    
    //Password should be minimum 5 characters with atleast one special character
    func isValidPassword() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "^(?=.*[a-zA-Z0-9])(?=.*[$@$#!%*?&]).{5,}$").evaluate(with: self)
    }
}
