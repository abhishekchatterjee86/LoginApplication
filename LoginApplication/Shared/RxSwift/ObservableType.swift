//
//  ObservableType.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RxSwift

extension ObservableType {
    
    public func take(
        _ count: Int,
        _ predicate: @escaping (Self.E) throws -> Bool) -> RxSwift.Observable<Self.E> {
        
        return filter(predicate).take(1)
    }
    
    public func first(_ predicate: @escaping (Self.E) throws -> Bool) -> RxSwift.Single<Self.E> {
        return take(1, predicate).asSingle()
    }
    
    public func unwrap<T>() -> Observable<T> where E == T? {
        return self.filter { $0 != nil }.map { $0! }
    }
}
