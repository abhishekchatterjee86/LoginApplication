//
//  HomeInteractor.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RIBs
import RxSwift
import RxCocoa

protocol HomeRouting: ViewableRouting { }

protocol HomePresentable: ScreenPresentable {
    var listener: HomePresentableListener? { get set }
    func set(viewModel: Driver<HomeViewModel>)
}

protocol HomeListener: AnyObject { }

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

    weak var router: HomeRouting?
    weak var listener: HomeListener?
   
    private let stateManager: HomeStateManager

    init(presenter: HomePresentable, username: String) {
        self.stateManager = HomeStateManager(username: username)
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        presenter.initEvent
            .subscribe(onCompleted: _init)
            .disposeOnDeactivate(interactor: self)
    }

    private func _init() {
        presenter.set(viewModel: stateManager.viewModelStream)
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}
