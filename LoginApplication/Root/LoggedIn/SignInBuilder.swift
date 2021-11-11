//
//  SignInBuilder.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs

protocol SignInDependency: Dependency { }

final class SignInComponent: Component<SignInDependency> {
    private let viewController: UIViewController

    init(dependency: SignInDependency, viewController: UIViewController) {
      self.viewController = viewController
      super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol SignInBuildable: Buildable {
    func build(withListener listener: SignInListener) -> SignInRouting
}

final class SignInBuilder: Builder<SignInDependency>, SignInBuildable {

    override init(dependency: SignInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SignInListener) -> SignInRouting {
        let viewController: SignInViewController = SignInViewController.instance()
        let component = SignInComponent(dependency: dependency, viewController: viewController)
        let interactor = SignInInteractor(component: component, presenter: viewController)
        interactor.listener = listener
        return SignInRouter(interactor: interactor, viewController: viewController)
    }
}
