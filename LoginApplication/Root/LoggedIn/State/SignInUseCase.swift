//
//  SignInUseCase.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RxCocoa
import RxSwift

class SignInUseCase {
    
    func validate(_ state: SignInState) -> Single<SignInState> {
        var errors: [String] = []

        if !isValid(username: state.username) { errors.append("User name") }
        if !isValid(password: state.password) { errors.append("Password") }

        guard errors.isEmpty else {
            let error = ApplicationError.validation(message: "Please enter a valid \(errors.sentence).")
            return Single.error(error)
        }
        
        return Single.just(state)
    }
    
    private func isValid(username: String) -> Bool {
        return username.isValidUsername()
    }
    
    private func isValid(password: String) -> Bool {
        return password.isValidPassword()
    }
}
