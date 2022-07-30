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
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    // retrive data from firestore
    func loadMessages() {
        // sets the data to an empty array
//        messages = []
        
        // get document from firestore
//        db.collection(K.FStore.collectionName).getDocuments { querySnapshot, error in
            
        // get document from firestore, sorts order and listen to update from firestore
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
            
            self.messages = []
            
            if let e = error {
                print("error fetching data from firestore\(e)")
            } else {
                
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        // data retives all fields in the document as a dictionary
                        let data = doc.data()
                        
                        // type cast the data as String
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            
                            // add newMessage to the message array
                            self.messages.append(newMessage)
                            
                            // reloads tableavaiew in the main queue to populate message cells
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }

    @IBAction func sendButton(_ sender: UIButton) {
        
        // firebase data storage -- message body and sender email
        if let messageBody = chatTextField.text, let messageSender = Auth.auth().currentUser?.email {
            
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : messageSender,
                K.FStore.bodyField : messageBody,
                K.FStore.dateField : Date().timeIntervalSince1970]) { error in
                if let e = error {
                    print("Issue saving file to firestore \(e)")
                }
                else {
                    print("Successfully saved data")
                }
            }
        }
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



