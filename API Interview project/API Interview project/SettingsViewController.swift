//
//  SettingsViewController.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var user: User?
    
    var userInformation = UserInformationClass()
    var users = [User] ()
    
    
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
        Task {
            await fetchAndHandleUser()
            performSegue(withIdentifier: "saveUnwind", sender: nil)
        }
        
    }
    
    
    func fetchAndHandleUser() async {
        var queryValues = [String]()
        if genderSwitch.isOn {
            queryValues.append("gender")
        }
        if locationSwitch.isOn {
            queryValues.append("location")
        }
        if emailSwitch.isOn {
            queryValues.append("email")
        }
        if registeredSwitch.isOn {
            queryValues.append("registered")
        }
        if dobSwitch.isOn {
            queryValues.append("dob")
        }
        if phoneSwitch.isOn {
            queryValues.append("phone")
        }
        if idSwitch.isOn {
            queryValues.append("id")
        }
        if nationalitySwitch.isOn {
            queryValues.append("nationality")
        }
        queryValues.append("picture")
        queryValues.append("name")
        
        let query = [
            "inc": queryValues.joined(separator: ","),
            "results": numberOfUsersTextField.text ?? "1" ]
        
        do {
            try await users = userInformation.fetchItems(matching: query)
        }
        catch {
            print(error)
            
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind",
        let vc = segue.destination as? DisplayingUsersTableViewController
        else { return }
        vc.users = users

    }
        
    
}
