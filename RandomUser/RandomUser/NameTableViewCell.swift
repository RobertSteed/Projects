//
//  NameTableViewCell.swift
//  RandomUser
//
//  Created by Robert Steed on 2/27/23.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    var name = [Name]()

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with name: Name) {
        nameLabel.text = name.name
    }

}
