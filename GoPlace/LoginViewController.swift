//
//  LoginViewController.swift
//  GoPlace
//
//  Created by Aakash Kishnani on 2/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension LoginViewController {
    @IBAction private func TapToClose(_ sender: Any) {
        self.view.endEditing(true)
    }
}

