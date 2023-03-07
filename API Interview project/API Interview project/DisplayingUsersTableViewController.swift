

//
//  DisplayingUsersTableViewController.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import UIKit

class DisplayingUsersTableViewController: UITableViewController {
    
    var user = User(gender: "", name: "", location: UserLocation.init(street: LocationStreet(number: 0, name: ""), city: ""), email: "", login: "", dob: UserDOB(date: "", age: 0), phone: "", id: UserID(name: "", value: ""), picture: "", registered: UserRegistration(date: "", age: 0), nationality: "")
    var userInformation = UserInformationClass()
    var users = [User] ()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    init?(coder: NSCoder, users: [User]?) {
        self.users = users!
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        cell.user = users[indexPath.row]
        cell.update(with: user)
//        let user = users[indexPath.row]
        
        
        
        return cell
    }
    
    func updateInformation() {
        
    }

    
//    @IBSegueAction func sendAPIUserInformation(_ coder: NSCoder, sender: Any?) -> SettingsViewController? { if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//        let passedUser = users[indexPath.row]
//        return SettingsViewController(coder: coder, user: passedUser)
//    }
//        return SettingsViewController(coder: coder, user: nil)
//    }
//
//    @IBSegueAction func sendAPIUserInformation(_ coder: NSCoder, sender: Any?) -> SettingsViewController? {
//        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//            let sentUser = users[indexPath.row]
//            return SettingsViewController(coder: coder, currentUser: sentUser)
//        }
//        return SettingsViewController(coder: coder, currentUser: nil)
//    }
////
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
