//
//  ViewController.swift
//  chatMe
//
//  Created by Marvellous Dirisu on 01/07/2022.
//

import UIKit
import CLTypingLabel


class WelcomeViewController: UIViewController {

    @IBOutlet weak var chatTitle: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTitle.text = "CHATMe"
        
        // create chat label animation using loops
//        chatTitle.text = ""
//        let titleLabel = "CHATMe"
//        var charIndex = 0.0
//
//        for letter in titleLabel {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
//                self.chatTitle.text?.append(letter)
//            }
//            charIndex += 1
//        }
        
    }

    
}

