//
//  HomeBuilder.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RIBs

protocol HomeDependency: Dependency { }

final class HomeComponent: Component<HomeDependency> { }

// MARK: - Builder

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener, username: String) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HomeListener, username: String) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController: HomeViewController = HomeViewController.instance()
        let interactor = HomeInteractor(presenter: viewController, username: username)
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
