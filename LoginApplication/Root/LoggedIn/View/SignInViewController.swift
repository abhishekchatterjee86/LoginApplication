//
//  SignInViewController.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol SignInPresentableListener: AnyObject { }

final class SignInViewController: BaseViewController, SignInViewControllable {
    
    weak var listener: SignInPresentableListener?
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var usernameFormView: FormView!
    @IBOutlet private weak var passwordFormView: FormView!
    @IBOutlet private weak var submitButton: SubmitButton!
    @IBOutlet private weak var bottomPadding: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bind()
        addGesture()
    }
    
    private func setup() {
        Observable.just(.username).bind(to: usernameFormView.rx.type).disposed(by: disposeBag)
        Observable.just(.password).bind(to: passwordFormView.rx.type).disposed(by: disposeBag)
    }
    
    private func bind() {
        
        let username = usernameFormView.rx.textFieldText.orEmpty.share(replay: 1)
        let password = passwordFormView.rx.textFieldText.orEmpty.share(replay: 1)
        
        username
            .filter { !$0.isEmpty }
            .map { $0.isValidUsername() }
            .bind(to: usernameFormView.rx.isCautionLabelHidden)
            .disposed(by: disposeBag)
        
        password
            .filter { !$0.isEmpty }
            .map { $0.isValidPassword() }
            .bind(to: passwordFormView.rx.isCautionLabelHidden)
            .disposed(by: disposeBag)
        
        Observable
            .combineLatest(username, password) { username, password in
                username.isValidUsername() && password.isValidPassword()
            }
            .bind(to: submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: Keyboard
    override func keyboardWillShow(notification: NSNotification) {
        view.animateWithKeyboard(notification: notification, constraint: bottomPadding, constant: 0)
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        view.animateWithKeyboard(notification: notification, constraint: bottomPadding, constant: 0)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - SignInPresentable
extension SignInViewController: SignInPresentable {

    func didChangeUsername() -> Observable<String> {
        return usernameFormView
            .rx.textFieldText
            .unwrap()
    }
    
    func didChangePassword() -> Observable<String> {
        return passwordFormView
            .rx.textFieldText
            .unwrap()
    }
    
    func didTapSubmit() -> Observable<Void> {
        return submitButton
            .rx.tap
            .asObservable()
    }
}
