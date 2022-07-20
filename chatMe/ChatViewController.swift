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
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        Message(sender: "12.com", body: "hello"),
        Message(sender: "13.com", body: "hello"),
        Message(sender: "14.com", body: "hello here")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func sendButton(_ sender: UIButton) {
        if let messageBody = chatTextField.text, let messageSender = Auth.auth().currentUser?.email
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

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
 
}

extension ChatViewController : UITableViewDelegate {
    
}



