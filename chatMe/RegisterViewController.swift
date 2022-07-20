//
//  RegisterViewController.swift
//  chatMe
//
//  Created by Marvellous Dirisu on 01/07/2022.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonPreesed(_ sender: UIButton) {
        if let email =  emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    // navigate to chatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
            
            
        }
        
    }
    
}

