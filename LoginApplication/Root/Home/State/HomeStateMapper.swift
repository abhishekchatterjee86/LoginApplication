//
//  HomeStateMapper.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import UIKit

class HomeStateMapper {
    func map(state: HomeState) -> HomeViewModel {
        return HomeViewModel(
            username: state.username
        )
    }
}
