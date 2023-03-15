//
//  UserTableViewCell.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    var user: User?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func update() {
        nameLabel.text = user?.name.first
        genderLabel.text = user?.gender
        locationLabel.text = user?.location?.city
        emailLabel.text = user?.email
        registeredLabel.text = user?.registered?.date
        dobLabel.text = user?.dob?.date
        phoneLabel.text = user?.phone
        idLabel.text = user?.id?.name
        nationalityLabel.text = user?.nationality
        
        if let url = URL(string: user?.picture.large ?? "") {
          URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
              self?.userImageView.image = UIImage(data: data)
            }
          }.resume()
        }
       
    }

}
