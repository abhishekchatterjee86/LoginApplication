//
//  UIView.swift
//  LoginApplication
//
//  Created by Abhishek Chatterjee on 06/10/21.
//

import UIKit

extension UIView {
    
    @discardableResult
    func loadNibToView() -> UIView {
        let viewFromNib = self.loadNib()
        viewFromNib.frame = self.bounds
        self.addSubview(viewFromNib)
        return viewFromNib
    }
    
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func animateWithKeyboard(notification: NSNotification, constraint: NSLayoutConstraint, constant: CGFloat) {
        let userInfo = notification.userInfo
        let keyboardFrameKey = UIResponder.keyboardFrameEndUserInfoKey
        let keyboardframeValue = userInfo?[keyboardFrameKey] as? NSValue
        let keyboardFrameRect = keyboardframeValue?.cgRectValue ?? CGRect.zero
        let keyboardFrameHeight = keyboardFrameRect.height
        let duration = userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let options = UIView.AnimationOptions(rawValue: curve)
        
        let targetHeight: CGFloat
        switch notification.name.rawValue {
        case "UIKeyboardDidHideNotification":
            targetHeight = constant
            
        default:
            targetHeight = max(constant, keyboardFrameHeight + constant - UIEdgeInsets.zero.bottom)
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            constraint.constant = targetHeight
            self.layoutIfNeeded()
        })
    }
}
