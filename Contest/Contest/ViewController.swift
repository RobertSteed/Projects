//
//  ViewController.swift
//  Contest
//
//  Created by Robert Steed on 11/30/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func enterButton(_ sender: Any) {
        if emailTextField.text == "" {
            print("Please enter a valid email")
            shakeTextField()
        } else {
            performSegue(withIdentifier: "buttonSegue", sender: nil)
            
        }
        
    }
    func shakeTextField() {
        
        UIView.animate(withDuration: 0.2, animations: {
            let shiftRight = CGAffineTransform(translationX: 10.0, y: 0.0)
            self.emailTextField.transform = shiftRight }) {(_) in
                
        UIView.animate(withDuration: 0.2, animations: {
        let shiftLeft = CGAffineTransform(translationX: -20.0, y: 0.0)
        self.emailTextField.transform = shiftLeft }, completion: {(_) in
        
    UIView.animate(withDuration: 0.2, animations: {
        let shiftCentre = CGAffineTransform(translationX: 0.0, y: 0.0)
        self.emailTextField.transform = shiftCentre
        self.emailTextField.transform = CGAffineTransform.identity
                        })
                    })
            }
    }
    
}
