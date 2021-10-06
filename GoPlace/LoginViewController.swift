//
//  LoginViewController.swift
//  GoPlace
//
//  Created by Aakash Kishnani on 2/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var cnsBottomScroll: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension LoginViewController {
    func registerKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func unregisterKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notificacion: Notification) {
        let animationDuration = notificacion.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        UIView.animate(withDuration: animationDuration) {
            self.cnsBottomScroll.constant = keyboardFrame.size.height
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(_ notificacion: Notification) {
        let animationDuration = notificacion.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.cnsBottomScroll.constant = 0
            self.view.layoutIfNeeded()
    }
}

}

