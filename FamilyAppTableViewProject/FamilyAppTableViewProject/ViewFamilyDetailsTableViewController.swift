//
//  ViewFamilyDetailsTableViewCell.swift
//  FamilyAppTableViewProject
//
//  Created by Robert Steed on 11/14/22.
//

import UIKit

class ViewFamilyDetailsTableViewController: UITableViewController {
    
    var familyMember: Family?
    
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var agesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let familyMember = familyMember else {return}
                updateTwo(with: familyMember)
     
    }
    
    
    func updateTwo(with family: Family) {
        namesLabel.text = family.names
        agesLabel.text = family.ages
        descriptionLabel.text = family.description
    }
    
    
}

