//
//  LoginViewController.swift
//  chatMe
//
//  Created by Marvellous Dirisu on 01/07/2022.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    @IBOutlet var passwordUserField: UITextField!
    @IBOutlet weak var emailUserField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    @IBAction func loginPressed(_ sender: UIButton) {
//        if let email = emailUserField.text, let password = passwordUserField.text {
//
//            Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
//
//                if let e = error {
//                    print(e)
//                } else {
//                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
//                }
//            }
//        }
//    }
    @IBAction func loginButton(_ sender: UIButton) {
        if let email = emailUserField.text, let password = passwordUserField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}

