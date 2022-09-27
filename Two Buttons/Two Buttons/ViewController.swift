//
//  ViewController.swift
//  Two Buttons
//
//  Created by Robert Steed on 9/6/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var TextField: UITextField!
    @IBAction func setTextButtonTapped(_ sender: Any) { label.text = ""
    }
    @IBAction func clearTextButtonTapped(_ sender: Any) { TextField.text = ""
    }
}





