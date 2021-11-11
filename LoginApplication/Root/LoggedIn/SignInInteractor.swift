//
//  SignInInteractor.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs
import RxSwift
import RxCocoa

protocol SignInRouting: ViewableRouting { }

protocol SignInPresentable: ScreenPresentable {
    var listener: SignInPresentableListener? { get set }
    
    func didChangeUsername() -> Observable<String>
    func didChangePassword() -> Observable<String>
    func didTapSubmit() -> Observable<Void>
}

protocol SignInListener: AnyObject {
    func handleLogin(username: String)
}

final class SignInInteractor: PresentableInteractor<SignInPresentable>, SignInInteractable {

    weak var router: SignInRouting?
    weak var listener: SignInListener?

    private let useCase: SignInUseCase
    private let stateManager: SignInStateManager

    init(component: SignInComponent, presenter: SignInPresentable) {
        self.stateManager = SignInStateManager()
        self.useCase = SignInUseCase()

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
        presenter.didTapSubmit()
            .subscribe(onNext: didTapSubmit)
            .disposeOnDeactivate(interactor: self)
        
        presenter.didChangeUsername()
            .subscribe(onNext: stateManager.updateUsername)
            .disposeOnDeactivate(interactor: self)
        
        presenter.didChangePassword()
            .subscribe(onNext: stateManager.updatePassword)
            .disposeOnDeactivate(interactor: self)
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: - SignInPresentableListener

extension SignInInteractor: SignInPresentableListener {

    private func didTapSubmit() {
        let state = stateManager.state.value
        useCase.validate(state)
            .map { $0.username }
            .subscribe(onSuccess: listener!.handleLogin)
            .disposeOnDeactivate(interactor: self)
    }
}
