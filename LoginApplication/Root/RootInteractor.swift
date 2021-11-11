//
//  RootInteractor.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func openWindow(window: UIWindow)
    func openLogin()
    func openHome(username: String)
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootListener: AnyObject { }

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    init(presenter: RootPresentable, component: RootComponent) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        router?.openLogin()
    }

    func handleLogin(username: String) {
        router?.openHome(username: username)
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}
