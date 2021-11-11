//
//  AppDelegate.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    internal var window: UIWindow?
    private var rootRouting: RootRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initWindow()

        return true
    }
    
    //MARK: Private
    
    private func initWindow() {
        let root = RootBuilder(dependency: AppComponent()).build()
        rootRouting = root
        window = UIWindow(frame: UIScreen.main.bounds)
        rootRouting!.openWindow(window: window!)
    }
}

