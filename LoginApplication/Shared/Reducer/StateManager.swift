//
//  StateManager.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RxSwift
import RxCocoa

class StateManager<State, ViewModel> {
    typealias StateMapper = (State) -> ViewModel
    
    private let queue = DispatchQueue.main
    private let stateMapper: StateMapper
    let state: BehaviorRelay<State>
    
    init(state: State, stateMapper: @escaping StateMapper) {
        self.state = BehaviorRelay(value: state)
        self.stateMapper = stateMapper
    }
    
    func update(transform: @escaping (inout State) -> ()) {
        queue.async {
            var state = self.state.value
            transform(&state)
            self.state.accept(state)
        }
    }
    
    var viewModelStream: Driver<ViewModel> {
        return state.asDriver().map(stateMapper)
    }
}
