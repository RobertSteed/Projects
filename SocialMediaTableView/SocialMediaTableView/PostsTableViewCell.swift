//
//  PostsTableViewCell.swift
//  SocialMediaTableView
//
//  Created by Robert Steed on 11/15/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func update(with post: Posts) {
        usernameLabel.text = post.username
        dateLabel.text = post.date.formatted()
        messageLabel.text = post.message
        
    }

}
