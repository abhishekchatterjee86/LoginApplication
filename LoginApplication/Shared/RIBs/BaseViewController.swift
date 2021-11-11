//
//  BaseViewController.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs
import RxSwift
import RxCocoa

class BaseViewController: UIViewController, ScreenPresentable {
    
    let disposeBag = DisposeBag()

    private let initSubject = BehaviorRelay(value: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubject.accept(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initSubject.accept(true)
    }
    
    private func handleEvents() {
        [(UIResponder.keyboardWillShowNotification, #selector(keyboardWillShow)),
         (UIResponder.keyboardDidHideNotification, #selector(keyboardWillHide))]
            .forEach ({
                NotificationCenter.default.addObserver(self, selector: $0.1, name: $0.0, object: nil)
            })
    }
    
    var initEvent: Completable {
        return initSubject
            .asObservable()
            .first { $0 }
            .asCompletable()
    }
}

// MARK: - KeyboardEvents

extension BaseViewController {
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardFrameKey = UIResponder.keyboardFrameEndUserInfoKey
        let keyboardframeValue = userInfo?[keyboardFrameKey] as? NSValue
        let keyboardFrameRect = keyboardframeValue?.cgRectValue ?? CGRect.zero
        return keyboardFrameRect.height
    }
    
    @objc func keyboardWillShow(notification: NSNotification) { }
    @objc func keyboardWillHide(notification: NSNotification) { }
}
