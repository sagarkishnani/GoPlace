//
//  LoginViewController.swift
//  GoPlace
//
//  Created by Aakash Kishnani on 2/10/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {
                (result, error) in
                
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func forgetPasswordButtonAction(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
                   DispatchQueue.main.async {
                       if self.emailTextField.text?.isEmpty==true || error != nil {
                           let resetFailedAlert = UIAlertController(title: "Fallo en reset de contraseña", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                           resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           self.present(resetFailedAlert, animated: true, completion: nil)
                       }
                       if error == nil && self.emailTextField.text?.isEmpty==false{
                           let resetEmailAlertSent = UIAlertController(title: "Email de reinicio enviado", message: "Un correo de reinicio ha sido enviado a tu correo de login, por favor sigue las instrucciones en el correo para reiniciar tu contraseña.", preferredStyle: .alert)
                           resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           self.present(resetEmailAlertSent, animated: true, completion: nil)
                       }
                   }
               }
    }
    
    
}

extension LoginViewController {
    @IBAction private func TapToClose(_ sender: Any) {
        self.view.endEditing(true)
    }
}

