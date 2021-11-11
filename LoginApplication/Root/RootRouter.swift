//
//  RootRouter.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs

protocol RootInteractable: Interactable, SignInListener, HomeListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: SignInViewControllable, NavigationViewControllable { }

final class RootRouter: BaseNavigationRouter<RootInteractable, RootViewControllable> {
    
    private let signIn: SignInBuildable
    private let home: HomeBuildable

    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         signIn: SignInBuildable,
         home: HomeBuildable) {
        
        self.signIn = signIn
        self.home = home
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension RootRouter: RootRouting {
    
    func openWindow(window: UIWindow) {
        window.rootViewController = viewControllable.uiviewController
        window.makeKeyAndVisible()
        interactable.activate()
        load()
    }
    
    func openLogin() {
        let router = signIn.build(withListener: interactor)
        attach(router: router)
    }
    
    func openHome(username: String) {
        let router = home.build(withListener: interactor, username: username)
        attachChild(router)
        viewController.push(viewController: router.viewControllable, animated: true)
    }
    
    private func attach(router: ViewableRouting) {
        DispatchQueue.main.async {
            self.attachChild(router)
            let controller = router.viewControllable
            self.viewController.set(viewController: controller, animated: true)
        }
    }
}
