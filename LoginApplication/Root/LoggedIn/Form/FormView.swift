//
//  FormView.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import RxCocoa
import RxSwift
import UIKit

final class FormView: UIView {
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var cautionLabel: UILabel!
    @IBOutlet fileprivate weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibToView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNibToView()
    }
}

// MARK: - Reactive Extension

extension Reactive where Base: FormView {
    
    var type: Binder<FormType> {
        return Binder(base) { view, type in
            view.titleLabel.text = type.title
            view.cautionLabel.text = type.caution
            view.textField.keyboardType = type.keyboardType
            view.textField.isSecureTextEntry = type.isSecureTextEntry
            view.textField.textContentType = type.textContentType
            view.textField.placeholder = type.placeholder
        }
    }
    
    var textFieldText: ControlProperty<String?> {
        return base.textField.rx.text
    }
    
    var isCautionLabelHidden: Binder<Bool> {
        return base.cautionLabel.rx.isHidden
    }
}

final class SubmitButton: UIButton {

    override var isEnabled: Bool {
        willSet {
            backgroundColor = newValue ? .blue : .lightGray
        }
    }
}
