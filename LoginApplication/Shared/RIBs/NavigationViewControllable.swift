//
//  NavigationViewControllable.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs
import UIKit
import Foundation

protocol NavigationViewControllable: ViewControllable {
    func set(viewController: ViewControllable, animated: Bool)
    func push(viewController: ViewControllable, animated: Bool)
    func pop(animated: Bool)
}

class BaseViewableRouter<InteractorType, ViewControllerType>: ViewableRouter<InteractorType, ViewControllerType> { }

class BaseNavigationRouter<InteractorType, ViewControllerType>: BaseViewableRouter<InteractorType, NavigationViewControllable> { }
