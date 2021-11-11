//
//  SignInStateManager.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import Foundation

class SignInStateManager: StateManager<SignInState, SignInViewModel> {
    
    init() {
        let state = SignInState(username: "", password: "")
        super.init(state: state, stateMapper: SignInMapper().map)
    }
    
    func updateUsername(_ username: String) {
        update { $0.username = username }
    }
    
    func updatePassword(_ password: String) {
        update { $0.password = password }
    }
}
