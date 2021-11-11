//
//  RootBuilder.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs

protocol RootDependency: Dependency { }

final class RootComponent: Component<RootDependency>, SignInDependency, HomeDependency {
    private let viewController: RootViewControllable
    
    init(dependency: RootDependency, viewController: RootViewControllable) {
        self.viewController = viewController
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
    
    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }
    
    func build() -> RootRouting {
        let viewController: RootViewController = RootViewController()
        let component = RootComponent(dependency: dependency, viewController: viewController)
        let interactor = RootInteractor(presenter: viewController, component: component)
        viewController.listener = interactor
        
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          signIn: SignInBuilder(dependency: component),
                          home: HomeBuilder(dependency: component))
    }
}
