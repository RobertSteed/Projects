//
//  ViewController.swift
//  Segues
//
//  Created by Robert Steed on 9/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = username.text
    }
    

    @IBOutlet weak var username: UITextField!
    
    @IBAction func forgotPassword(_ sender: UIButton) { performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
    @IBAction func forgotUsername(_ sender: UIButton) { performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

