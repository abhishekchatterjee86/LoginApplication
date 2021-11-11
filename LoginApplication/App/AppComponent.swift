//
//  AppComponent.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(
            dependency: EmptyComponent()
        )
    }
}
