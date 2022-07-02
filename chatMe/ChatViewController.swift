//
//  ChatViewController.swift
//  chatMe
//
//  Created by Marvellous Dirisu on 01/07/2022.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CHATMe"
        navigationItem.hidesBackButton = true
    }

    @IBAction func sendButton(_ sender: UIButton) {
    }
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
    do {
        navigationController?.popToRootViewController(animated: true)
        try firebaseAuth.signOut()
    } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
    }
      
    }
    
}

