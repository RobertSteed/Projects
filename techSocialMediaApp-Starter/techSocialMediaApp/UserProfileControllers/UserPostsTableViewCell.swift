//
//  UserPostsTableViewCell.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/16/23.
//

import UIKit

class UserPostsTableViewCell: UITableViewCell {
    
    var userPost = [Post]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with userPost: Post) {
        titleLabel.text = userPost.title
        bodyLabel.text = userPost.body
    }

}
