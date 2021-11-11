//
//  Array.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import Foundation

extension Array where Element == String {
    var sentence: String {
        guard let last = last else { return "" }
        return count <= 2 ? joined(separator:" and ") :
            dropLast().joined(separator: ", ") + " and " + last
    }
}
