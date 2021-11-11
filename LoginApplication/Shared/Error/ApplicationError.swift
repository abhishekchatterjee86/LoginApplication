//
//  ApplicationError.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import UIKit

enum ApplicationError: LocalizedError {
    case validation(message: String?)
    
    var errorDescription: String? {
        switch self {
        case
            .validation(let message):
            return message ?? "There seems to be an error."
        }
    }
}
