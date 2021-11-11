//
//  SignInRouter.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs

protocol SignInInteractable: Interactable {
    var router: SignInRouting? { get set }
    var listener: SignInListener? { get set }
}

protocol SignInViewControllable: ViewControllable { }

final class SignInRouter: BaseViewableRouter<SignInInteractable, SignInViewControllable>, SignInRouting {

    override init(interactor: SignInInteractable, viewController: SignInViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
