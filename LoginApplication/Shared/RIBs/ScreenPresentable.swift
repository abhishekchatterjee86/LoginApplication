//
//  ScreenPresentable.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RIBs
import RxSwift
import Foundation

protocol ScreenPresentable: Presentable {
    var initEvent: Completable { get }
}
