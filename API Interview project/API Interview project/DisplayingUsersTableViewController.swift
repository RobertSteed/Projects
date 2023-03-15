

//
//  DisplayingUsersTableViewController.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import UIKit

class DisplayingUsersTableViewController: UITableViewController {
    
    
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
      
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
   
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        cell.user = users[indexPath.row]
        
        cell.update()
        
        return cell
    }
    
  
    
    }
