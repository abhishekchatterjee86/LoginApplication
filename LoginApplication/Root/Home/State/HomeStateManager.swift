//
//  HomeStateManager.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import Foundation

class HomeStateManager: StateManager<HomeState, HomeViewModel> {
    
    init(username: String) {
        let state = HomeState(username: username)
        super.init(state: state, stateMapper: HomeStateMapper().map)
    }
}
