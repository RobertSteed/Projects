//
//  FamilyTableViewCell.swift
//  FamilyAppTableViewProject
//
//  Created by Robert Steed on 11/14/22.
//

import UIKit

class FamilyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var familyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with family: Family) {
        familyName.text = family.names
    }

}
