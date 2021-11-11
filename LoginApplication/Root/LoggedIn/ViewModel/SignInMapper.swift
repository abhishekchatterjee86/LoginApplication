//
//  SignInMapper.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import Foundation

class SignInMapper {
    
    func map(state: SignInState) -> SignInViewModel {
        return SignInViewModel(username: state.username, password: state.password)
    }
}
