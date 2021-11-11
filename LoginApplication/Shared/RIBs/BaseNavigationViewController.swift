//
//  BaseNavigationViewController.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RxSwift
import RxCocoa
import RIBs

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - NavigationViewControllable

extension BaseNavigationViewController: NavigationViewControllable {
    
    func push(viewController: ViewControllable, animated: Bool) {
        pushViewController(viewController.uiviewController, animated: animated)
    }
    
    func pop(animated: Bool) {
        if viewControllers.count > 1 {
            popViewController(animated: animated)
        }
    }
    
    func set(viewController: ViewControllable, animated: Bool) {
        setViewControllers([viewController.uiviewController], animated: animated)
    }
}

