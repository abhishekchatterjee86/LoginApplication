//
//  UIViewController.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import UIKit

extension UIViewController {
    static func instance<T: UIViewController>() -> T {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! T
        return controller
    }
}
