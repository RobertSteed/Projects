//
//  ViewController.swift
//  TextValidationApp
//
//  Created by Robert Steed on 10/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "Incorrect Password", message: "You have typed an incorrect password. Please Try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in NSLog ("The \"Ok\" Alert Occured. ")}))

        return alert
    }()
    
    @IBAction func login(_ sender: UIButton) {
        guard textIsValidPassword(passwordTextField.text ?? "") else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func textIsValidPassword(_ text: String) -> Bool {
        var hasSpecialCharacter = text.contains { currentCharacterInPassword in
            return "!@#$%^&*()-=_+`~".contains(currentCharacterInPassword)
        }
        var isLongEnough = text.count >= 8
        return hasSpecialCharacter && isLongEnough
//        return text.contains("!") || text.contains("@") || text.contains("#")
//        return text.contains(sender > 8 character || "!" || "@" || "#")
//        return false
    }

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

//I need to create a guard statement that will check what the user is inputting
//Do I do an error message or should I send them to another screen?

