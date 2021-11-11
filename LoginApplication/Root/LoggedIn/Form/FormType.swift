//
//  FormType.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import UIKit

enum FormType: Int, CaseIterable {
    case username
    case password
    
    var title: String {
        switch self {
        case .username:
            return "Name"
        case .password:
            return "Password"
        }
    }
    
    var placeholder: String {
        switch self {
        case .username:
            return "Enter username"
        case .password:
            return "Enter password"
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .username:
            return .namePhonePad
        case .password:
            return .asciiCapable
        }
    }
    
    var isSecureTextEntry: Bool {
        switch self {
        case .username:
            return false
        case .password:
            return true
        }
    }
    
    var textContentType: UITextContentType {
        switch self {
        case .username:
            return .name
        case .password:
            return .newPassword
        }
    }
    
    var caution: String {
        switch self {
        case .username:
            return "Enter proper user name."
        case .password:
            return "Password not meeting the criteria."
        }
    }
}
