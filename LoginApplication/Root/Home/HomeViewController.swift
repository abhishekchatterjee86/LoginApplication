//
//  HomeViewController.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 07/10/21.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol HomePresentableListener: AnyObject { }

final class HomeViewController: BaseViewController, HomeViewControllable {

    @IBOutlet weak var usernameLabel: UILabel!
    
    weak var listener: HomePresentableListener?
    
    private func render(_ viewModel: HomeViewModel) {
        usernameLabel.text = "Hello " + viewModel.username
    }
}

// MARK: - HomePresentable

extension HomeViewController: HomePresentable {
    
    func set(viewModel: Driver<HomeViewModel>) {
        viewModel
            .drive(onNext: { [weak self] in self?.render($0) })
            .disposed(by: disposeBag)
    }
}
