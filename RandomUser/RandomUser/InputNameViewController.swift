//
//  InputNameViewController.swift
//  RandomUser
//
//  Created by Robert Steed on 2/27/23.
//

import UIKit

protocol InputNameViewControllerDelegate: AnyObject {
    func inputNameViewController(_ Controller: InputNameViewController, didSelect name: Name)
}

class InputNameViewController: UIViewController {
    
//    var name = Name(name: "")
    weak var delegate: InputNameViewControllerDelegate?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let personsName = nameTextField.text ?? ""
        let name = Name(name: personsName)
            delegate?.inputNameViewController(self, didSelect: name)
    }
    
 

}
