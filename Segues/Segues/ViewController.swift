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
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }
    

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var forgotPassword: UIButton!
    
    @IBOutlet weak var forgotUsername: UIButton!
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "errorPage", sender: sender)
    
        }
    
    
    @IBAction func forgotUsername(_ sender: UIButton) {
        performSegue(withIdentifier: "errorPage", sender: sender)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

