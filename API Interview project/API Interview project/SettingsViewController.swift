//
//  SettingsViewController.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var currentUser = User.current
    var userInformation = UserInformationClass()

    
    
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var emailSwitch: UISwitch!
    @IBOutlet weak var registeredSwitch: UISwitch!
    @IBOutlet weak var dobSwitch: UISwitch!
    @IBOutlet weak var phoneSwitch: UISwitch!
    @IBOutlet weak var idSwitch: UISwitch!
    @IBOutlet weak var nationalitySwitch: UISwitch!
    @IBOutlet weak var numberOfUsersTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    func fetchAndHandleUser() async {
        var queryString = ""
        if genderSwitch.isOn {
            queryString += "gender,"
        } else if locationSwitch.isOn {
            queryString += "location,"
        } else if emailSwitch.isOn {
            queryString += "email,"
        } else if registeredSwitch.isOn {
            queryString += "registered,"
        } else if dobSwitch.isOn {
            queryString += "dob,"
        } else if phoneSwitch.isOn {
            queryString += "phone,"
        } else if idSwitch.isOn {
            queryString += "id,"
        } else if nationalitySwitch.isOn {
            queryString += "nationality"
        }
//         else if loginSwitch.isOn {
//            queryString += "login,"
//        }
        
        let query = [
            "inc": queryString
        ]
        
        do {
            try await currentUser = userInformation.fetchItems(matching: query: query)
        }
    }

    
    
    @IBAction func numberOfUsersTextField(_ sender: Any) {
    }
    
    
    @IBAction func genderSwitch(_ sender: Any) {
        
    }
    
    @IBAction func locationSwitch(_ sender: Any) {
        
    }
    
    @IBAction func emailSwitch(_ sender: Any) {
        
    }
    

    
    @IBAction func registeredSwitch(_ sender: Any) {
        
    }
    
    @IBAction func dobSwitch(_ sender: Any) {
        
    }
    @IBAction func phoneSwitch(_ sender: Any) {
        
    }
    
    @IBAction func idSwitch(_ sender: Any) {
        
    }
    
    @IBAction func nationalitySwitch(_ sender: Any) {
        
    }
    
    
    
}
