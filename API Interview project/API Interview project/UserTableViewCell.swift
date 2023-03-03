//
//  UserTableViewCell.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with user: User) {
        nameLabel.text = user.name
        genderLabel.text = user.gender
        locationLabel.text = user.location
        emailLabel.text = user.email
        loginLabel.text = user.login
        registeredLabel.text = user.registered
        dobLabel.text = user.dob
        phoneLabel.text = user.phone
        idLabel.text = user.id
        nationalityLabel.text = user.nationality
    }

}
